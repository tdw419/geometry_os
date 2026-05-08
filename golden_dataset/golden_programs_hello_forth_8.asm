; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r14, 32
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 72
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 101
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 108
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 108
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 111
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 32
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 102
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 114
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 111
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 109
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 32
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 70
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 111
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 114
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 116
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 104
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 33
  LDI r9, 0xFFB
  STORE r9, r14    ; emit char
  LDI r14, 10
  LDI r9, 0xFFB
  STORE r9, r14    ; newline
RET
word_1:
; : SQUARE 
  LDI r14, 1
  LOAD r14, [r30]       ; DUP: peek TOS
  PUSH r14
  LOAD r4, [r30]       ; TOS
  LDI r14, 1
  ADD r30, r14          ; SP++
  LOAD r3, [r30]       ; NOS
  MUL r4, r3           ; TOS * NOS
  STORE [r30], r4
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r14, 1
  LOAD r14, [r30]       ; DUP: peek TOS
  PUSH r14
  LOAD r14, [r30]       ; pop number
  LDI r3, 1
  ADD r30, r3
  LDI r9, 0xFFB
  STORE r9, r14    ; write to debug port
  LDI r14, 10
  LDI r9, 0xFFB
  STORE r9, r14    ; newline
  LDI r14, 1
  LOAD r3, [r30]
  SUB r3, r14
  STORE [r30], r3
  LDI r14, 1
  LOAD r14, [r30]       ; DUP: peek TOS
  PUSH r14
  LOAD r14, [r30]
  CMPI r14, 0
  JZ r11, zerogt_4_false
  LDI r14, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r14, 0
  zerogt_4_done:
  STORE [r30], r14
  LOAD r14, [r30]       ; pop condition
  LDI r3, 1
  ADD r30, r3
  CMPI r14, 0
  JZ r11, begin_3
  LDI r11, 1
  ADD r30, r11          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 53
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 115
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 113
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 117
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 97
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 114
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 101
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 100
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 61
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 5
PUSH r14
CALL word_1
; (call SQUARE)
LOAD r14, [r30]       ; pop number
LDI r3, 1
ADD r30, r3
LDI r9, 0xFFB
STORE r9, r14    ; write to debug port
LDI r14, 10
LDI r9, 0xFFB
STORE r9, r14    ; newline
; dotquote:  Countdown from 5:
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 67
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 111
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 117
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 110
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 116
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 100
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 111
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 119
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 110
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 102
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 114
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 111
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 109
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 32
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 53
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 58
LDI r9, 0xFFB
STORE r9, r14    ; emit char
LDI r14, 10
LDI r9, 0xFFB
STORE r9, r14    ; newline
LDI r14, 5
PUSH r14
CALL word_2
; (call COUNTDOWN)
HALT