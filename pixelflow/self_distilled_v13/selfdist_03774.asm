; DESCRIPTION: Draws a blue line from (331, 97) to (174, 152).
; PLAN: r0=331(x1), r1=97(y1), r2=174(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 97
LDI r2, 174
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
