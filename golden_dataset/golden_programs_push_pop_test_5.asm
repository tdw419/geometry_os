; DESCRIPTION: Draws a red object at the screen with fixed size.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r13, 100
  LDI r5, 200
  LDI r4, 300
  PUSH r13           ; push 100
  PUSH r5           ; push 200
  PUSH r4           ; push 300
  POP r6            ; r6 = 300 (top)
  POP r1            ; r1 = 200
  POP r7            ; r7 = 100
  LDI r12, 0x0200
  STORE r12, r6     ; RAM[0x0200] = 300
  LDI r12, 0x0201
  STORE r12, r1     ; RAM[0x0201] = 200
  LDI r12, 0x0202
  STORE r12, r7     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r13, 0
  PUSH r13           ; push 0
  LDI r13, 1
  PUSH r13           ; push 1
  LDI r13, 2
  PUSH r13           ; push 2
  POP r6            ; r6 = 2
  POP r1            ; r1 = 1
  POP r7            ; r7 = 0
  LDI r12, 0x0203
  STORE r12, r6     ; RAM[0x0203] = 2
  LDI r12, 0x0204
  STORE r12, r1     ; RAM[0x0204] = 1
  LDI r12, 0x0205
  STORE r12, r7     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r13, 42
  PUSH r13           ; push at SP = 0xFF00
  POP r6            ; r6 should be 42 if SP is correct
  LDI r12, 0x0206
  STORE r12, r6     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r13, 777
  PUSH r13           ; save 777
  LDI r13, 0         ; clobber r13
  ADD r13, r5        ; r13 = 0 + r5 (some garbage value)
  LDI r13, 0
  ADD r13, r4
  POP r6            ; r6 should still be 777
  LDI r12, 0x0207
  STORE r12, r6     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r13, 10
  PUSH r13
  LDI r13, 20
  PUSH r13
  LDI r13, 30
  PUSH r13
  LDI r13, 40
  PUSH r13
  LDI r13, 50
  PUSH r13
  ; Pop into r6 and accumulate sum
  LDI r6, 0
  POP r1
  ADD r6, r1        ; 50
  POP r1
  ADD r6, r1        ; 50+40=90
  POP r1
  ADD r6, r1        ; 90+30=120
  POP r1
  ADD r6, r1        ; 120+20=140
  POP r1
  ADD r6, r1        ; 140+10=150
  LDI r12, 0x0208
  STORE r12, r6     ; RAM[0x0208] = 150

  HALT
