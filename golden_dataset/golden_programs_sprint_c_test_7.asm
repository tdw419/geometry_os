; DESCRIPTION: A red object centered at the screen with fixed size.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r6, 17
  LDI r13, 5
  MOD r6, r13        ; r6 = 17 % 5 = 2
  LDI r1, 0x0200
  STORE r1, r6     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r6, 10
  LDI r13, 3
  MOD r6, r13        ; r6 = 10 % 3 = 1
  LDI r1, 0x0201
  STORE r1, r6     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r2, pop into r5 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r11, 42
  LDI r7, 99
  PUSH r11           ; push 42
  PUSH r7           ; push 99
  POP r2            ; r2 = 99 (last in, first out)
  POP r5            ; r5 = 42
  LDI r1, 0x0202
  STORE r1, r2     ; RAM[0x0202] = 99
  LDI r1, 0x0203
  STORE r1, r5     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r6, 3
  LDI r13, 10
  CMP r6, r13        ; r6 = -1 (3 < 10)
  BLT r6, blt_taken
  ; Not taken -- store 0
  LDI r1, 0x0204
  LDI r11, 0
  STORE r1, r11
  JMP blt_done
blt_taken:
  LDI r1, 0x0204
  LDI r11, 1
  STORE r1, r11     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r6, 10
  LDI r13, 3
  CMP r6, r13        ; r6 = 1 (10 > 3)
  BLT r6, blt_fail
  ; Falls through (correct) -- store 0
  LDI r1, 0x0205
  LDI r11, 0
  STORE r1, r11     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r1, 0x0205
  LDI r11, 1
  STORE r1, r11     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r6, 10
  LDI r13, 3
  CMP r6, r13        ; r6 = 1 (10 > 3, so >=)
  BGE r6, bge_taken
  ; Not taken -- store 0
  LDI r1, 0x0206
  LDI r11, 0
  STORE r1, r11
  JMP bge_done
bge_taken:
  LDI r1, 0x0206
  LDI r11, 1
  STORE r1, r11     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r6, 5
  LDI r13, 5
  CMP r6, r13        ; r6 = 0 (5 == 5, so >= is true)
  BGE r6, bge_eq_taken
  LDI r1, 0x0207
  LDI r11, 0
  STORE r1, r11
  JMP bge_eq_done
bge_eq_taken:
  LDI r1, 0x0207
  LDI r11, 1
  STORE r1, r11     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
