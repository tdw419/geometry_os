; DESCRIPTION: Draws a blue line from (205, 130) to (88, 161).
; PLAN: r0=205(x1), r1=130(y1), r2=88(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 130
LDI r2, 88
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
