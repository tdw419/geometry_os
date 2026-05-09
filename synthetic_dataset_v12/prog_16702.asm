; DESCRIPTION: Renders a orange line between points (190, 250) and (462, 128).
; PLAN: r0=190(x1), r1=250(y1), r2=462(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 250
LDI r2, 462
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
