; DESCRIPTION: Renders a yellow line between points (367, 46) and (134, 88).
; PLAN: r0=367(x1), r1=46(y1), r2=134(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 46
LDI r2, 134
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
