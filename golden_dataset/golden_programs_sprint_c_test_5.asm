; DESCRIPTION: This GeOS assembly code performs a series of tests to verify the functionality of basic arithmetic operations (MOD), stack operations (PUSH/POP), and conditional branching instructions (BLT/BGE). The results of these tests are stored in RAM addresses ranging from 0x0200 to 0x0207.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r8, 17
  LDI r0, 5
  MOD r8, r0        ; r8 = 17 % 5 = 2
  LDI r12, 0x0200
  STORE r12, r8     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r8, 10
  LDI r0, 3
  MOD r8, r0        ; r8 = 10 % 3 = 1
  LDI r12, 0x0201
  STORE r12, r8     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r9, pop into r15 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r6, 42
  LDI r11, 99
  PUSH r6           ; push 42
  PUSH r11           ; push 99
  POP r9            ; r9 = 99 (last in, first out)
  POP r15            ; r15 = 42
  LDI r12, 0x0202
  STORE r12, r9     ; RAM[0x0202] = 99
  LDI r12, 0x0203
  STORE r12, r15     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r8, 3
  LDI r0, 10
  CMP r8, r0        ; r8 = -1 (3 < 10)
  BLT r8, blt_taken
  ; Not taken -- store 0
  LDI r12, 0x0204
  LDI r6, 0
  STORE r12, r6
  JMP blt_done
blt_taken:
  LDI r12, 0x0204
  LDI r6, 1
  STORE r12, r6     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r8, 10
  LDI r0, 3
  CMP r8, r0        ; r8 = 1 (10 > 3)
  BLT r8, blt_fail
  ; Falls through (correct) -- store 0
  LDI r12, 0x0205
  LDI r6, 0
  STORE r12, r6     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r12, 0x0205
  LDI r6, 1
  STORE r12, r6     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r8, 10
  LDI r0, 3
  CMP r8, r0        ; r8 = 1 (10 > 3, so >=)
  BGE r8, bge_taken
  ; Not taken -- store 0
  LDI r12, 0x0206
  LDI r6, 0
  STORE r12, r6
  JMP bge_done
bge_taken:
  LDI r12, 0x0206
  LDI r6, 1
  STORE r12, r6     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r8, 5
  LDI r0, 5
  CMP r8, r0        ; r8 = 0 (5 == 5, so >= is true)
  BGE r8, bge_eq_taken
  LDI r12, 0x0207
  LDI r6, 0
  STORE r12, r6
  JMP bge_eq_done
bge_eq_taken:
  LDI r12, 0x0207
  LDI r6, 1
  STORE r12, r6     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
