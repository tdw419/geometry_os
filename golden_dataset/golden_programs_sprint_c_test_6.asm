; DESCRIPTION: This GeOS assembly code performs a series of tests to verify the functionality of basic arithmetic operations (MOD), stack operations (PUSH/POP), and conditional branching instructions (BLT/BGE). The results of these tests are stored in RAM addresses ranging from 0x0200 to 0x0207.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r11, 17
  LDI r1, 5
  MOD r11, r1        ; r11 = 17 % 5 = 2
  LDI r2, 0x0200
  STORE r2, r11     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r11, 10
  LDI r1, 3
  MOD r11, r1        ; r11 = 10 % 3 = 1
  LDI r2, 0x0201
  STORE r2, r11     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r15, pop into r13 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r14, 42
  LDI r12, 99
  PUSH r14           ; push 42
  PUSH r12           ; push 99
  POP r15            ; r15 = 99 (last in, first out)
  POP r13            ; r13 = 42
  LDI r2, 0x0202
  STORE r2, r15     ; RAM[0x0202] = 99
  LDI r2, 0x0203
  STORE r2, r13     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r11, 3
  LDI r1, 10
  CMP r11, r1        ; r11 = -1 (3 < 10)
  BLT r11, blt_taken
  ; Not taken -- store 0
  LDI r2, 0x0204
  LDI r14, 0
  STORE r2, r14
  JMP blt_done
blt_taken:
  LDI r2, 0x0204
  LDI r14, 1
  STORE r2, r14     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r11, 10
  LDI r1, 3
  CMP r11, r1        ; r11 = 1 (10 > 3)
  BLT r11, blt_fail
  ; Falls through (correct) -- store 0
  LDI r2, 0x0205
  LDI r14, 0
  STORE r2, r14     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r2, 0x0205
  LDI r14, 1
  STORE r2, r14     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r11, 10
  LDI r1, 3
  CMP r11, r1        ; r11 = 1 (10 > 3, so >=)
  BGE r11, bge_taken
  ; Not taken -- store 0
  LDI r2, 0x0206
  LDI r14, 0
  STORE r2, r14
  JMP bge_done
bge_taken:
  LDI r2, 0x0206
  LDI r14, 1
  STORE r2, r14     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r11, 5
  LDI r1, 5
  CMP r11, r1        ; r11 = 0 (5 == 5, so >= is true)
  BGE r11, bge_eq_taken
  LDI r2, 0x0207
  LDI r14, 0
  STORE r2, r14
  JMP bge_eq_done
bge_eq_taken:
  LDI r2, 0x0207
  LDI r14, 1
  STORE r2, r14     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
