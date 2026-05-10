; DESCRIPTION: Renders a orange line between points (16, 64) and (359, 51).
; PLAN: r0=16(x1), r1=64(y1), r2=359(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 64
LDI r2, 359
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
