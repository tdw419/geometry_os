; DESCRIPTION: Draws a blue line from (397, 97) to (314, 208).
; PLAN: r0=397(x1), r1=97(y1), r2=314(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 97
LDI r2, 314
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
