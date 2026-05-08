; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r11, 100
  LDI r8, 200
  LDI r3, 300
  PUSH r11           ; push 100
  PUSH r8           ; push 200
  PUSH r3           ; push 300
  POP r13            ; r13 = 300 (top)
  POP r0            ; r0 = 200
  POP r4            ; r4 = 100
  LDI r1, 0x0200
  STORE r1, r13     ; RAM[0x0200] = 300
  LDI r1, 0x0201
  STORE r1, r0     ; RAM[0x0201] = 200
  LDI r1, 0x0202
  STORE r1, r4     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r11, 0
  PUSH r11           ; push 0
  LDI r11, 1
  PUSH r11           ; push 1
  LDI r11, 2
  PUSH r11           ; push 2
  POP r13            ; r13 = 2
  POP r0            ; r0 = 1
  POP r4            ; r4 = 0
  LDI r1, 0x0203
  STORE r1, r13     ; RAM[0x0203] = 2
  LDI r1, 0x0204
  STORE r1, r0     ; RAM[0x0204] = 1
  LDI r1, 0x0205
  STORE r1, r4     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r11, 42
  PUSH r11           ; push at SP = 0xFF00
  POP r13            ; r13 should be 42 if SP is correct
  LDI r1, 0x0206
  STORE r1, r13     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r11, 777
  PUSH r11           ; save 777
  LDI r11, 0         ; clobber r11
  ADD r11, r8        ; r11 = 0 + r8 (some garbage value)
  LDI r11, 0
  ADD r11, r3
  POP r13            ; r13 should still be 777
  LDI r1, 0x0207
  STORE r1, r13     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r11, 10
  PUSH r11
  LDI r11, 20
  PUSH r11
  LDI r11, 30
  PUSH r11
  LDI r11, 40
  PUSH r11
  LDI r11, 50
  PUSH r11
  ; Pop into r13 and accumulate sum
  LDI r13, 0
  POP r0
  ADD r13, r0        ; 50
  POP r0
  ADD r13, r0        ; 50+40=90
  POP r0
  ADD r13, r0        ; 90+30=120
  POP r0
  ADD r13, r0        ; 120+20=140
  POP r0
  ADD r13, r0        ; 140+10=150
  LDI r1, 0x0208
  STORE r1, r13     ; RAM[0x0208] = 150

  HALT
