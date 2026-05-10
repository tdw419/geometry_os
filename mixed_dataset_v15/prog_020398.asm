; DESCRIPTION: Renders a orange line between points (87, 10) and (439, 64).
; PLAN: r0=87(x1), r1=10(y1), r2=439(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 10
LDI r2, 439
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
