; DESCRIPTION: Draws a purple line from (188, 224) to (162, 225).
; PLAN: r0=188(x1), r1=224(y1), r2=162(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 224
LDI r2, 162
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
