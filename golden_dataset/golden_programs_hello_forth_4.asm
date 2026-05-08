; DESCRIPTION: Draw square: pos=the screen, color=red, size=fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r1, 32
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 72
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 101
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 108
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 108
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 111
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 32
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 102
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 114
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 111
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 109
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 32
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 70
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 111
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 114
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 116
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 104
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 33
  LDI r10, 0xFFB
  STORE r10, r1    ; emit char
  LDI r1, 10
  LDI r10, 0xFFB
  STORE r10, r1    ; newline
RET
word_1:
; : SQUARE 
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r11, [r30]       ; TOS
  LDI r1, 1
  ADD r30, r1          ; SP++
  LOAD r15, [r30]       ; NOS
  MUL r11, r15           ; TOS * NOS
  STORE [r30], r11
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r1, [r30]       ; pop number
  LDI r15, 1
  ADD r30, r15
  LDI r10, 0xFFB
  STORE r10, r1    ; write to debug port
  LDI r1, 10
  LDI r10, 0xFFB
  STORE r10, r1    ; newline
  LDI r1, 1
  LOAD r15, [r30]
  SUB r15, r1
  STORE [r30], r15
  LDI r1, 1
  LOAD r1, [r30]       ; DUP: peek TOS
  PUSH r1
  LOAD r1, [r30]
  CMPI r1, 0
  JZ r2, zerogt_4_false
  LDI r1, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r1, 0
  zerogt_4_done:
  STORE [r30], r1
  LOAD r1, [r30]       ; pop condition
  LDI r15, 1
  ADD r30, r15
  CMPI r1, 0
  JZ r2, begin_3
  LDI r2, 1
  ADD r30, r2          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 53
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 115
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 113
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 117
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 97
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 114
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 101
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 100
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 61
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 5
PUSH r1
CALL word_1
; (call SQUARE)
LOAD r1, [r30]       ; pop number
LDI r15, 1
ADD r30, r15
LDI r10, 0xFFB
STORE r10, r1    ; write to debug port
LDI r1, 10
LDI r10, 0xFFB
STORE r10, r1    ; newline
; dotquote:  Countdown from 5:
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 67
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 111
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 117
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 110
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 116
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 100
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 111
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 119
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 110
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 102
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 114
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 111
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 109
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 32
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 53
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 58
LDI r10, 0xFFB
STORE r10, r1    ; emit char
LDI r1, 10
LDI r10, 0xFFB
STORE r10, r1    ; newline
LDI r1, 5
PUSH r1
CALL word_2
; (call COUNTDOWN)
HALT