; DESCRIPTION: Draws a blue line from (331, 103) to (158, 44).
; PLAN: r0=331(x1), r1=103(y1), r2=158(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 103
LDI r2, 158
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
