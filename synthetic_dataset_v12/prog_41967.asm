; DESCRIPTION: Renders a orange line between points (448, 150) and (372, 192).
; PLAN: r0=448(x1), r1=150(y1), r2=372(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 150
LDI r2, 372
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
