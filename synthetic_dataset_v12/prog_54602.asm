; DESCRIPTION: Renders a orange line between points (87, 172) and (448, 69).
; PLAN: r0=87(x1), r1=172(y1), r2=448(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 172
LDI r2, 448
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
