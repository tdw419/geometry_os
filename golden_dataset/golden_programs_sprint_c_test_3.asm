; DESCRIPTION: A red object centered at the screen with fixed size.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r2, 17
  LDI r0, 5
  MOD r2, r0        ; r2 = 17 % 5 = 2
  LDI r8, 0x0200
  STORE r8, r2     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r2, 10
  LDI r0, 3
  MOD r2, r0        ; r2 = 10 % 3 = 1
  LDI r8, 0x0201
  STORE r8, r2     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r9, pop into r3 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r4, 42
  LDI r11, 99
  PUSH r4           ; push 42
  PUSH r11           ; push 99
  POP r9            ; r9 = 99 (last in, first out)
  POP r3            ; r3 = 42
  LDI r8, 0x0202
  STORE r8, r9     ; RAM[0x0202] = 99
  LDI r8, 0x0203
  STORE r8, r3     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r2, 3
  LDI r0, 10
  CMP r2, r0        ; r2 = -1 (3 < 10)
  BLT r2, blt_taken
  ; Not taken -- store 0
  LDI r8, 0x0204
  LDI r4, 0
  STORE r8, r4
  JMP blt_done
blt_taken:
  LDI r8, 0x0204
  LDI r4, 1
  STORE r8, r4     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r2, 10
  LDI r0, 3
  CMP r2, r0        ; r2 = 1 (10 > 3)
  BLT r2, blt_fail
  ; Falls through (correct) -- store 0
  LDI r8, 0x0205
  LDI r4, 0
  STORE r8, r4     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r8, 0x0205
  LDI r4, 1
  STORE r8, r4     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r2, 10
  LDI r0, 3
  CMP r2, r0        ; r2 = 1 (10 > 3, so >=)
  BGE r2, bge_taken
  ; Not taken -- store 0
  LDI r8, 0x0206
  LDI r4, 0
  STORE r8, r4
  JMP bge_done
bge_taken:
  LDI r8, 0x0206
  LDI r4, 1
  STORE r8, r4     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r2, 5
  LDI r0, 5
  CMP r2, r0        ; r2 = 0 (5 == 5, so >= is true)
  BGE r2, bge_eq_taken
  LDI r8, 0x0207
  LDI r4, 0
  STORE r8, r4
  JMP bge_eq_done
bge_eq_taken:
  LDI r8, 0x0207
  LDI r4, 1
  STORE r8, r4     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
