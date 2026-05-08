; DESCRIPTION: Draws a red object at the screen with fixed size.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r14, 17
  LDI r9, 5
  MOD r14, r9        ; r14 = 17 % 5 = 2
  LDI r12, 0x0200
  STORE r12, r14     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r14, 10
  LDI r9, 3
  MOD r14, r9        ; r14 = 10 % 3 = 1
  LDI r12, 0x0201
  STORE r12, r14     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r5, pop into r13 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r4, 42
  LDI r6, 99
  PUSH r4           ; push 42
  PUSH r6           ; push 99
  POP r5            ; r5 = 99 (last in, first out)
  POP r13            ; r13 = 42
  LDI r12, 0x0202
  STORE r12, r5     ; RAM[0x0202] = 99
  LDI r12, 0x0203
  STORE r12, r13     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r14, 3
  LDI r9, 10
  CMP r14, r9        ; r14 = -1 (3 < 10)
  BLT r14, blt_taken
  ; Not taken -- store 0
  LDI r12, 0x0204
  LDI r4, 0
  STORE r12, r4
  JMP blt_done
blt_taken:
  LDI r12, 0x0204
  LDI r4, 1
  STORE r12, r4     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r14, 10
  LDI r9, 3
  CMP r14, r9        ; r14 = 1 (10 > 3)
  BLT r14, blt_fail
  ; Falls through (correct) -- store 0
  LDI r12, 0x0205
  LDI r4, 0
  STORE r12, r4     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r12, 0x0205
  LDI r4, 1
  STORE r12, r4     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r14, 10
  LDI r9, 3
  CMP r14, r9        ; r14 = 1 (10 > 3, so >=)
  BGE r14, bge_taken
  ; Not taken -- store 0
  LDI r12, 0x0206
  LDI r4, 0
  STORE r12, r4
  JMP bge_done
bge_taken:
  LDI r12, 0x0206
  LDI r4, 1
  STORE r12, r4     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r14, 5
  LDI r9, 5
  CMP r14, r9        ; r14 = 0 (5 == 5, so >= is true)
  BGE r14, bge_eq_taken
  LDI r12, 0x0207
  LDI r4, 0
  STORE r12, r4
  JMP bge_eq_done
bge_eq_taken:
  LDI r12, 0x0207
  LDI r4, 1
  STORE r12, r4     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
