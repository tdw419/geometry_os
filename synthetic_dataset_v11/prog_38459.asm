; DESCRIPTION: Draws a yellow line from (191, 130) to (55, 70).
; PLAN: r0=191(x1), r1=130(y1), r2=55(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 130
LDI r2, 55
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
