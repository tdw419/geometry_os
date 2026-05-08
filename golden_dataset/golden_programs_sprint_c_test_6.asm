; DESCRIPTION: Draws a red object at the screen with fixed size.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r15, 17
  LDI r0, 5
  MOD r15, r0        ; r15 = 17 % 5 = 2
  LDI r6, 0x0200
  STORE r6, r15     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r15, 10
  LDI r0, 3
  MOD r15, r0        ; r15 = 10 % 3 = 1
  LDI r6, 0x0201
  STORE r6, r15     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r1, pop into r7 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r9, 42
  LDI r14, 99
  PUSH r9           ; push 42
  PUSH r14           ; push 99
  POP r1            ; r1 = 99 (last in, first out)
  POP r7            ; r7 = 42
  LDI r6, 0x0202
  STORE r6, r1     ; RAM[0x0202] = 99
  LDI r6, 0x0203
  STORE r6, r7     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r15, 3
  LDI r0, 10
  CMP r15, r0        ; r15 = -1 (3 < 10)
  BLT r15, blt_taken
  ; Not taken -- store 0
  LDI r6, 0x0204
  LDI r9, 0
  STORE r6, r9
  JMP blt_done
blt_taken:
  LDI r6, 0x0204
  LDI r9, 1
  STORE r6, r9     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r15, 10
  LDI r0, 3
  CMP r15, r0        ; r15 = 1 (10 > 3)
  BLT r15, blt_fail
  ; Falls through (correct) -- store 0
  LDI r6, 0x0205
  LDI r9, 0
  STORE r6, r9     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r6, 0x0205
  LDI r9, 1
  STORE r6, r9     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r15, 10
  LDI r0, 3
  CMP r15, r0        ; r15 = 1 (10 > 3, so >=)
  BGE r15, bge_taken
  ; Not taken -- store 0
  LDI r6, 0x0206
  LDI r9, 0
  STORE r6, r9
  JMP bge_done
bge_taken:
  LDI r6, 0x0206
  LDI r9, 1
  STORE r6, r9     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r15, 5
  LDI r0, 5
  CMP r15, r0        ; r15 = 0 (5 == 5, so >= is true)
  BGE r15, bge_eq_taken
  LDI r6, 0x0207
  LDI r9, 0
  STORE r6, r9
  JMP bge_eq_done
bge_eq_taken:
  LDI r6, 0x0207
  LDI r9, 1
  STORE r6, r9     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
