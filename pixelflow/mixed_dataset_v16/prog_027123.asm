; DESCRIPTION: Draws a blue line from (418, 178) to (453, 205).
; PLAN: r0=418(x1), r1=178(y1), r2=453(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 178
LDI r2, 453
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
