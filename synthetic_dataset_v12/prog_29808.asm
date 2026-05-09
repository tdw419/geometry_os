; DESCRIPTION: Draws a orange line from (3, 144) to (439, 234).
; PLAN: r0=3(x1), r1=144(y1), r2=439(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 144
LDI r2, 439
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
