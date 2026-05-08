; DESCRIPTION: Geometry OS program to draw a red object.

; Sprint C test: MOD, PUSH/POP, BLT/BGE
; Results stored at RAM[0x0200..0x0209]

; ── Test 1: MOD -- 17 % 5 = 2 ──
  LDI r11, 17
  LDI r10, 5
  MOD r11, r10        ; r11 = 17 % 5 = 2
  LDI r14, 0x0200
  STORE r14, r11     ; RAM[0x0200] = 2

; ── Test 2: MOD -- 10 % 3 = 1 ──
  LDI r11, 10
  LDI r10, 3
  MOD r11, r10        ; r11 = 10 % 3 = 1
  LDI r14, 0x0201
  STORE r14, r11     ; RAM[0x0201] = 1

; ── Test 3: PUSH/POP -- push 42, push 99, pop into r7, pop into r0 ──
  LDI r30, 0xFF00   ; set stack pointer to top of RAM
  LDI r6, 42
  LDI r8, 99
  PUSH r6           ; push 42
  PUSH r8           ; push 99
  POP r7            ; r7 = 99 (last in, first out)
  POP r0            ; r0 = 42
  LDI r14, 0x0202
  STORE r14, r7     ; RAM[0x0202] = 99
  LDI r14, 0x0203
  STORE r14, r0     ; RAM[0x0203] = 42

; ── Test 4: BLT -- if 3 < 10, store 1 at 0x0204 ──
  LDI r11, 3
  LDI r10, 10
  CMP r11, r10        ; r11 = -1 (3 < 10)
  BLT r11, blt_taken
  ; Not taken -- store 0
  LDI r14, 0x0204
  LDI r6, 0
  STORE r14, r6
  JMP blt_done
blt_taken:
  LDI r14, 0x0204
  LDI r6, 1
  STORE r14, r6     ; RAM[0x0204] = 1
blt_done:

; ── Test 5: BLT NOT taken -- if 10 < 3, branch (should not) ──
  LDI r11, 10
  LDI r10, 3
  CMP r11, r10        ; r11 = 1 (10 > 3)
  BLT r11, blt_fail
  ; Falls through (correct) -- store 0
  LDI r14, 0x0205
  LDI r6, 0
  STORE r14, r6     ; RAM[0x0205] = 0 (BLT correctly not taken)
  JMP blt_pass
blt_fail:
  LDI r14, 0x0205
  LDI r6, 1
  STORE r14, r6     ; RAM[0x0205] = 1 (WRONG)
blt_pass:

; ── Test 6: BGE -- if 10 >= 3, store 1 at 0x0206 ──
  LDI r11, 10
  LDI r10, 3
  CMP r11, r10        ; r11 = 1 (10 > 3, so >=)
  BGE r11, bge_taken
  ; Not taken -- store 0
  LDI r14, 0x0206
  LDI r6, 0
  STORE r14, r6
  JMP bge_done
bge_taken:
  LDI r14, 0x0206
  LDI r6, 1
  STORE r14, r6     ; RAM[0x0206] = 1
bge_done:

; ── Test 7: BGE with equal values -- if 5 >= 5, store 1 at 0x0207 ──
  LDI r11, 5
  LDI r10, 5
  CMP r11, r10        ; r11 = 0 (5 == 5, so >= is true)
  BGE r11, bge_eq_taken
  LDI r14, 0x0207
  LDI r6, 0
  STORE r14, r6
  JMP bge_eq_done
bge_eq_taken:
  LDI r14, 0x0207
  LDI r6, 1
  STORE r14, r6     ; RAM[0x0207] = 1
bge_eq_done:

  HALT
