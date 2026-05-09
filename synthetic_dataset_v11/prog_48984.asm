; DESCRIPTION: Draws a orange line from (35, 130) to (69, 100).
; PLAN: r0=35(x1), r1=130(y1), r2=69(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 130
LDI r2, 69
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
