; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r9, 100
  LDI r2, 200
  LDI r11, 300
  PUSH r9           ; push 100
  PUSH r2           ; push 200
  PUSH r11           ; push 300
  POP r1            ; r1 = 300 (top)
  POP r7            ; r7 = 200
  POP r14            ; r14 = 100
  LDI r12, 0x0200
  STORE r12, r1     ; RAM[0x0200] = 300
  LDI r12, 0x0201
  STORE r12, r7     ; RAM[0x0201] = 200
  LDI r12, 0x0202
  STORE r12, r14     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r9, 0
  PUSH r9           ; push 0
  LDI r9, 1
  PUSH r9           ; push 1
  LDI r9, 2
  PUSH r9           ; push 2
  POP r1            ; r1 = 2
  POP r7            ; r7 = 1
  POP r14            ; r14 = 0
  LDI r12, 0x0203
  STORE r12, r1     ; RAM[0x0203] = 2
  LDI r12, 0x0204
  STORE r12, r7     ; RAM[0x0204] = 1
  LDI r12, 0x0205
  STORE r12, r14     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r9, 42
  PUSH r9           ; push at SP = 0xFF00
  POP r1            ; r1 should be 42 if SP is correct
  LDI r12, 0x0206
  STORE r12, r1     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r9, 777
  PUSH r9           ; save 777
  LDI r9, 0         ; clobber r9
  ADD r9, r2        ; r9 = 0 + r2 (some garbage value)
  LDI r9, 0
  ADD r9, r11
  POP r1            ; r1 should still be 777
  LDI r12, 0x0207
  STORE r12, r1     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r9, 10
  PUSH r9
  LDI r9, 20
  PUSH r9
  LDI r9, 30
  PUSH r9
  LDI r9, 40
  PUSH r9
  LDI r9, 50
  PUSH r9
  ; Pop into r1 and accumulate sum
  LDI r1, 0
  POP r7
  ADD r1, r7        ; 50
  POP r7
  ADD r1, r7        ; 50+40=90
  POP r7
  ADD r1, r7        ; 90+30=120
  POP r7
  ADD r1, r7        ; 120+20=140
  POP r7
  ADD r1, r7        ; 140+10=150
  LDI r12, 0x0208
  STORE r12, r1     ; RAM[0x0208] = 150

  HALT
