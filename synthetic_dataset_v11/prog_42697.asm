; DESCRIPTION: Draws a orange line from (100, 130) to (35, 243).
; PLAN: r0=100(x1), r1=130(y1), r2=35(x2), r3=243(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 130
LDI r2, 35
LDI r3, 243
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
