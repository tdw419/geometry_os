; DESCRIPTION: Display a object using color red at the screen.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r14, 100
  LDI r0, 200
  LDI r13, 300
  PUSH r14           ; push 100
  PUSH r0           ; push 200
  PUSH r13           ; push 300
  POP r6            ; r6 = 300 (top)
  POP r15            ; r15 = 200
  POP r12            ; r12 = 100
  LDI r4, 0x0200
  STORE r4, r6     ; RAM[0x0200] = 300
  LDI r4, 0x0201
  STORE r4, r15     ; RAM[0x0201] = 200
  LDI r4, 0x0202
  STORE r4, r12     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r14, 0
  PUSH r14           ; push 0
  LDI r14, 1
  PUSH r14           ; push 1
  LDI r14, 2
  PUSH r14           ; push 2
  POP r6            ; r6 = 2
  POP r15            ; r15 = 1
  POP r12            ; r12 = 0
  LDI r4, 0x0203
  STORE r4, r6     ; RAM[0x0203] = 2
  LDI r4, 0x0204
  STORE r4, r15     ; RAM[0x0204] = 1
  LDI r4, 0x0205
  STORE r4, r12     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r14, 42
  PUSH r14           ; push at SP = 0xFF00
  POP r6            ; r6 should be 42 if SP is correct
  LDI r4, 0x0206
  STORE r4, r6     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r14, 777
  PUSH r14           ; save 777
  LDI r14, 0         ; clobber r14
  ADD r14, r0        ; r14 = 0 + r0 (some garbage value)
  LDI r14, 0
  ADD r14, r13
  POP r6            ; r6 should still be 777
  LDI r4, 0x0207
  STORE r4, r6     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r14, 10
  PUSH r14
  LDI r14, 20
  PUSH r14
  LDI r14, 30
  PUSH r14
  LDI r14, 40
  PUSH r14
  LDI r14, 50
  PUSH r14
  ; Pop into r6 and accumulate sum
  LDI r6, 0
  POP r15
  ADD r6, r15        ; 50
  POP r15
  ADD r6, r15        ; 50+40=90
  POP r15
  ADD r6, r15        ; 90+30=120
  POP r15
  ADD r6, r15        ; 120+20=140
  POP r15
  ADD r6, r15        ; 140+10=150
  LDI r4, 0x0208
  STORE r4, r6     ; RAM[0x0208] = 150

  HALT
