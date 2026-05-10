; DESCRIPTION: Draws a blue line from (88, 8) to (175, 224).
; PLAN: r0=88(x1), r1=8(y1), r2=175(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 8
LDI r2, 175
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
