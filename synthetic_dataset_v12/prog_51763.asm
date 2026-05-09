; DESCRIPTION: Draws a orange line from (205, 130) to (435, 53).
; PLAN: r0=205(x1), r1=130(y1), r2=435(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 130
LDI r2, 435
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
