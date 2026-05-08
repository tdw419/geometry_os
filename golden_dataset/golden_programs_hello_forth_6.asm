; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r0, 32
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 72
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 101
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 108
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 108
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 111
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 32
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 102
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 114
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 111
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 109
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 32
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 70
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 111
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 114
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 116
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 104
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 33
  LDI r2, 0xFFB
  STORE r2, r0    ; emit char
  LDI r0, 10
  LDI r2, 0xFFB
  STORE r2, r0    ; newline
RET
word_1:
; : SQUARE 
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r6, [r30]       ; TOS
  LDI r0, 1
  ADD r30, r0          ; SP++
  LOAD r1, [r30]       ; NOS
  MUL r6, r1           ; TOS * NOS
  STORE [r30], r6
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r0, [r30]       ; pop number
  LDI r1, 1
  ADD r30, r1
  LDI r2, 0xFFB
  STORE r2, r0    ; write to debug port
  LDI r0, 10
  LDI r2, 0xFFB
  STORE r2, r0    ; newline
  LDI r0, 1
  LOAD r1, [r30]
  SUB r1, r0
  STORE [r30], r1
  LDI r0, 1
  LOAD r0, [r30]       ; DUP: peek TOS
  PUSH r0
  LOAD r0, [r30]
  CMPI r0, 0
  JZ r13, zerogt_4_false
  LDI r0, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r0, 0
  zerogt_4_done:
  STORE [r30], r0
  LOAD r0, [r30]       ; pop condition
  LDI r1, 1
  ADD r30, r1
  CMPI r0, 0
  JZ r13, begin_3
  LDI r13, 1
  ADD r30, r13          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 53
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 115
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 113
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 117
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 97
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 114
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 101
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 100
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 61
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 5
PUSH r0
CALL word_1
; (call SQUARE)
LOAD r0, [r30]       ; pop number
LDI r1, 1
ADD r30, r1
LDI r2, 0xFFB
STORE r2, r0    ; write to debug port
LDI r0, 10
LDI r2, 0xFFB
STORE r2, r0    ; newline
; dotquote:  Countdown from 5:
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 67
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 111
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 117
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 110
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 116
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 100
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 111
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 119
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 110
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 102
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 114
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 111
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 109
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 32
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 53
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 58
LDI r2, 0xFFB
STORE r2, r0    ; emit char
LDI r0, 10
LDI r2, 0xFFB
STORE r2, r0    ; newline
LDI r0, 5
PUSH r0
CALL word_2
; (call COUNTDOWN)
HALT