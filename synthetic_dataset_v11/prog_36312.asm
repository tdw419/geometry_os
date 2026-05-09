; DESCRIPTION: Draws a orange line from (88, 130) to (124, 26).
; PLAN: r0=88(x1), r1=130(y1), r2=124(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 130
LDI r2, 124
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
