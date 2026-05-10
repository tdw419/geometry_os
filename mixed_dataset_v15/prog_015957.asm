; DESCRIPTION: Renders a orange line between points (105, 124) and (375, 128).
; PLAN: r0=105(x1), r1=124(y1), r2=375(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 124
LDI r2, 375
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
