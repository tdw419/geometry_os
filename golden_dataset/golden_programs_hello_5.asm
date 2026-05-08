; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r5, 32
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 72
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 101
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 108
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 108
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 111
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 32
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 102
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 114
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 111
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 109
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 32
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 70
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 111
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 114
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 116
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 104
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 33
  LDI r0, 0xFFB
  STORE r0, r5    ; emit char
  LDI r5, 10
  LDI r0, 0xFFB
  STORE r0, r5    ; newline
RET
word_1:
; : SQUARE 
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r1, [r30]       ; TOS
  LDI r5, 1
  ADD r30, r5          ; SP++
  LOAD r6, [r30]       ; NOS
  MUL r1, r6           ; TOS * NOS
  STORE [r30], r1
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r5, [r30]       ; pop number
  LDI r6, 1
  ADD r30, r6
  LDI r0, 0xFFB
  STORE r0, r5    ; write to debug port
  LDI r5, 10
  LDI r0, 0xFFB
  STORE r0, r5    ; newline
  LDI r5, 1
  LOAD r6, [r30]
  SUB r6, r5
  STORE [r30], r6
  LDI r5, 1
  LOAD r5, [r30]       ; DUP: peek TOS
  PUSH r5
  LOAD r5, [r30]
  CMPI r5, 0
  JZ r8, zerogt_4_false
  LDI r5, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r5, 0
  zerogt_4_done:
  STORE [r30], r5
  LOAD r5, [r30]       ; pop condition
  LDI r6, 1
  ADD r30, r6
  CMPI r5, 0
  JZ r8, begin_3
  LDI r8, 1
  ADD r30, r8          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 53
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 115
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 113
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 117
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 97
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 114
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 101
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 100
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 61
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 5
PUSH r5
CALL word_1
; (call SQUARE)
LOAD r5, [r30]       ; pop number
LDI r6, 1
ADD r30, r6
LDI r0, 0xFFB
STORE r0, r5    ; write to debug port
LDI r5, 10
LDI r0, 0xFFB
STORE r0, r5    ; newline
; dotquote:  Countdown from 5:
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 67
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 111
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 117
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 110
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 116
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 100
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 111
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 119
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 110
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 102
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 114
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 111
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 109
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 32
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 53
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 58
LDI r0, 0xFFB
STORE r0, r5    ; emit char
LDI r5, 10
LDI r0, 0xFFB
STORE r0, r5    ; newline
LDI r5, 5
PUSH r5
CALL word_2
; (call COUNTDOWN)
HALT