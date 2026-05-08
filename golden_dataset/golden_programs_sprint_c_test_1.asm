; DESCRIPTION: Geometry OS program to draw a red object.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r5, 17
  LDI r14, 5
  MOD r5, r14        ; r5 = 17 % 5 = 2
  LDI r8, 0x0200
  STORE r8, r5     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r5, 10
  LDI r14, 3
  MOD r5, r14        ; r5 = 10 % 3 = 1
  LDI r8, 0x0201
  STORE r8, r5     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r10, pop into r6 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r7, 42
  LDI r13, 99
  PUSH r7           ; push 42
  PUSH r13           ; push 99
  POP r10            ; r10 = 99 (last in, first out)
  POP r6            ; r6 = 42
  LDI r8, 0x0202
  STORE r8, r10     ; RAM[0x0202] = 99
  LDI r8, 0x0203
  STORE r8, r6     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r5, 3
  LDI r14, 10
  CMP r5, r14        ; r5 = -1 (3 < 10)
  BLT r5, blt_taken
  ; Not taken -- store 0
  LDI r8, 0x0204
  LDI r7, 0
  STORE r8, r7
  JMP blt_done
blt_taken:
  LDI r8, 0x0204
  LDI r7, 1
  STORE r8, r7     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r5, 10
  LDI r14, 3
  CMP r5, r14        ; r5 = 1 (10 > 3)
  BLT r5, blt_fail
  ; Falls through (correct) -- store 0
  LDI r8, 0x0205
  LDI r7, 0
  STORE r8, r7     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r8, 0x0205
  LDI r7, 1
  STORE r8, r7     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r5, 10
  LDI r14, 3
  CMP r5, r14        ; r5 = 1 (10 > 3, so >=)
  BGE r5, bge_taken
  ; Not taken -- store 0
  LDI r8, 0x0206
  LDI r7, 0
  STORE r8, r7
  JMP bge_done
bge_taken:
  LDI r8, 0x0206
  LDI r7, 1
  STORE r8, r7     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r5, 5
  LDI r14, 5
  CMP r5, r14        ; r5 = 0 (5 == 5, so >= is true)
  BGE r5, bge_eq_taken
  LDI r8, 0x0207
  LDI r7, 0
  STORE r8, r7
  JMP bge_eq_done
bge_eq_taken:
  LDI r8, 0x0207
  LDI r7, 1
  STORE r8, r7     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
