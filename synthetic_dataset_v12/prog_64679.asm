; DESCRIPTION: Draws a orange line from (439, 96) to (318, 64).
; PLAN: r0=439(x1), r1=96(y1), r2=318(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 96
LDI r2, 318
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
