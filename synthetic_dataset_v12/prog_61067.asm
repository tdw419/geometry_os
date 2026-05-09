; DESCRIPTION: Renders a yellow line between points (88, 70) and (183, 69).
; PLAN: r0=88(x1), r1=70(y1), r2=183(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 70
LDI r2, 183
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
