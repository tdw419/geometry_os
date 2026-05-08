; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r12, 17
  LDI r7, 5
  MOD r12, r7        ; r12 = 17 % 5 = 2
  LDI r3, 0x0200
  STORE r3, r12     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r12, 10
  LDI r7, 3
  MOD r12, r7        ; r12 = 10 % 3 = 1
  LDI r3, 0x0201
  STORE r3, r12     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r1, pop into r6 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r8, 42
  LDI r2, 99
  PUSH r8           ; push 42
  PUSH r2           ; push 99
  POP r1            ; r1 = 99 (last in, first out)
  POP r6            ; r6 = 42
  LDI r3, 0x0202
  STORE r3, r1     ; RAM[0x0202] = 99
  LDI r3, 0x0203
  STORE r3, r6     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r12, 3
  LDI r7, 10
  CMP r12, r7        ; r12 = -1 (3 < 10)
  BLT r12, blt_taken
  ; Not taken -- store 0
  LDI r3, 0x0204
  LDI r8, 0
  STORE r3, r8
  JMP blt_done
blt_taken:
  LDI r3, 0x0204
  LDI r8, 1
  STORE r3, r8     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r12, 10
  LDI r7, 3
  CMP r12, r7        ; r12 = 1 (10 > 3)
  BLT r12, blt_fail
  ; Falls through (correct) -- store 0
  LDI r3, 0x0205
  LDI r8, 0
  STORE r3, r8     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r3, 0x0205
  LDI r8, 1
  STORE r3, r8     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r12, 10
  LDI r7, 3
  CMP r12, r7        ; r12 = 1 (10 > 3, so >=)
  BGE r12, bge_taken
  ; Not taken -- store 0
  LDI r3, 0x0206
  LDI r8, 0
  STORE r3, r8
  JMP bge_done
bge_taken:
  LDI r3, 0x0206
  LDI r8, 1
  STORE r3, r8     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r12, 5
  LDI r7, 5
  CMP r12, r7        ; r12 = 0 (5 == 5, so >= is true)
  BGE r12, bge_eq_taken
  LDI r3, 0x0207
  LDI r8, 0
  STORE r3, r8
  JMP bge_eq_done
bge_eq_taken:
  LDI r3, 0x0207
  LDI r8, 1
  STORE r3, r8     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
