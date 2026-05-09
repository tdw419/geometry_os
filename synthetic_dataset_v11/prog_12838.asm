; DESCRIPTION: Draws a black line from (99, 88) to (113, 130).
; PLAN: r0=99(x1), r1=88(y1), r2=113(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 88
LDI r2, 113
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
