; DESCRIPTION: Draw square: pos=the screen, color=red, size=fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r8, 32
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 72
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 101
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 108
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 108
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 111
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 32
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 102
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 114
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 111
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 109
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 32
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 70
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 111
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 114
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 116
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 104
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 33
  LDI r11, 0xFFB
  STORE r11, r8    ; emit char
  LDI r8, 10
  LDI r11, 0xFFB
  STORE r11, r8    ; newline
RET
word_1:
; : SQUARE 
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r1, [r30]       ; TOS
  LDI r8, 1
  ADD r30, r8          ; SP++
  LOAD r5, [r30]       ; NOS
  MUL r1, r5           ; TOS * NOS
  STORE [r30], r1
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r8, [r30]       ; pop number
  LDI r5, 1
  ADD r30, r5
  LDI r11, 0xFFB
  STORE r11, r8    ; write to debug port
  LDI r8, 10
  LDI r11, 0xFFB
  STORE r11, r8    ; newline
  LDI r8, 1
  LOAD r5, [r30]
  SUB r5, r8
  STORE [r30], r5
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r8, [r30]
  CMPI r8, 0
  JZ r13, zerogt_4_false
  LDI r8, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r8, 0
  zerogt_4_done:
  STORE [r30], r8
  LOAD r8, [r30]       ; pop condition
  LDI r5, 1
  ADD r30, r5
  CMPI r8, 0
  JZ r13, begin_3
  LDI r13, 1
  ADD r30, r13          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 53
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 115
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 113
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 117
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 97
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 114
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 101
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 100
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 61
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 5
PUSH r8
CALL word_1
; (call SQUARE)
LOAD r8, [r30]       ; pop number
LDI r5, 1
ADD r30, r5
LDI r11, 0xFFB
STORE r11, r8    ; write to debug port
LDI r8, 10
LDI r11, 0xFFB
STORE r11, r8    ; newline
; dotquote:  Countdown from 5:
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 67
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 111
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 117
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 110
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 116
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 100
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 111
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 119
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 110
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 102
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 114
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 111
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 109
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 32
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 53
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 58
LDI r11, 0xFFB
STORE r11, r8    ; emit char
LDI r8, 10
LDI r11, 0xFFB
STORE r11, r8    ; newline
LDI r8, 5
PUSH r8
CALL word_2
; (call COUNTDOWN)
HALT