; DESCRIPTION: Display a object using color red at the screen.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r7, 17
  LDI r8, 5
  MOD r7, r8        ; r7 = 17 % 5 = 2
  LDI r2, 0x0200
  STORE r2, r7     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r7, 10
  LDI r8, 3
  MOD r7, r8        ; r7 = 10 % 3 = 1
  LDI r2, 0x0201
  STORE r2, r7     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r4, pop into r5 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r0, 42
  LDI r14, 99
  PUSH r0           ; push 42
  PUSH r14           ; push 99
  POP r4            ; r4 = 99 (last in, first out)
  POP r5            ; r5 = 42
  LDI r2, 0x0202
  STORE r2, r4     ; RAM[0x0202] = 99
  LDI r2, 0x0203
  STORE r2, r5     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r7, 3
  LDI r8, 10
  CMP r7, r8        ; r7 = -1 (3 < 10)
  BLT r7, blt_taken
  ; Not taken -- store 0
  LDI r2, 0x0204
  LDI r0, 0
  STORE r2, r0
  JMP blt_done
blt_taken:
  LDI r2, 0x0204
  LDI r0, 1
  STORE r2, r0     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r7, 10
  LDI r8, 3
  CMP r7, r8        ; r7 = 1 (10 > 3)
  BLT r7, blt_fail
  ; Falls through (correct) -- store 0
  LDI r2, 0x0205
  LDI r0, 0
  STORE r2, r0     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r2, 0x0205
  LDI r0, 1
  STORE r2, r0     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r7, 10
  LDI r8, 3
  CMP r7, r8        ; r7 = 1 (10 > 3, so >=)
  BGE r7, bge_taken
  ; Not taken -- store 0
  LDI r2, 0x0206
  LDI r0, 0
  STORE r2, r0
  JMP bge_done
bge_taken:
  LDI r2, 0x0206
  LDI r0, 1
  STORE r2, r0     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r7, 5
  LDI r8, 5
  CMP r7, r8        ; r7 = 0 (5 == 5, so >= is true)
  BGE r7, bge_eq_taken
  LDI r2, 0x0207
  LDI r0, 0
  STORE r2, r0
  JMP bge_eq_done
bge_eq_taken:
  LDI r2, 0x0207
  LDI r0, 1
  STORE r2, r0     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
