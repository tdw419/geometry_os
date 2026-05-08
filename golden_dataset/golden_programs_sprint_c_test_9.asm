; DESCRIPTION: Display a object using color red at the screen.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r15, 17
  LDI r4, 5
  MOD r15, r4        ; r15 = 17 % 5 = 2
  LDI r13, 0x0200
  STORE r13, r15     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r15, 10
  LDI r4, 3
  MOD r15, r4        ; r15 = 10 % 3 = 1
  LDI r13, 0x0201
  STORE r13, r15     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r6, pop into r7 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r5, 42
  LDI r9, 99
  PUSH r5           ; push 42
  PUSH r9           ; push 99
  POP r6            ; r6 = 99 (last in, first out)
  POP r7            ; r7 = 42
  LDI r13, 0x0202
  STORE r13, r6     ; RAM[0x0202] = 99
  LDI r13, 0x0203
  STORE r13, r7     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r15, 3
  LDI r4, 10
  CMP r15, r4        ; r15 = -1 (3 < 10)
  BLT r15, blt_taken
  ; Not taken -- store 0
  LDI r13, 0x0204
  LDI r5, 0
  STORE r13, r5
  JMP blt_done
blt_taken:
  LDI r13, 0x0204
  LDI r5, 1
  STORE r13, r5     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r15, 10
  LDI r4, 3
  CMP r15, r4        ; r15 = 1 (10 > 3)
  BLT r15, blt_fail
  ; Falls through (correct) -- store 0
  LDI r13, 0x0205
  LDI r5, 0
  STORE r13, r5     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r13, 0x0205
  LDI r5, 1
  STORE r13, r5     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r15, 10
  LDI r4, 3
  CMP r15, r4        ; r15 = 1 (10 > 3, so >=)
  BGE r15, bge_taken
  ; Not taken -- store 0
  LDI r13, 0x0206
  LDI r5, 0
  STORE r13, r5
  JMP bge_done
bge_taken:
  LDI r13, 0x0206
  LDI r5, 1
  STORE r13, r5     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r15, 5
  LDI r4, 5
  CMP r15, r4        ; r15 = 0 (5 == 5, so >= is true)
  BGE r15, bge_eq_taken
  LDI r13, 0x0207
  LDI r5, 0
  STORE r13, r5
  JMP bge_eq_done
bge_eq_taken:
  LDI r13, 0x0207
  LDI r5, 1
  STORE r13, r5     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
