; DESCRIPTION: Draws a blue line from (248, 56) to (44, 56).
; PLAN: r0=248(x1), r1=56(y1), r2=44(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 56
LDI r2, 44
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
