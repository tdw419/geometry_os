; DESCRIPTION: Renders a orange line between points (497, 35) and (64, 74).
; PLAN: r0=497(x1), r1=35(y1), r2=64(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 35
LDI r2, 64
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
