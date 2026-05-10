; DESCRIPTION: Renders a orange line between points (383, 246) and (439, 208).
; PLAN: r0=383(x1), r1=246(y1), r2=439(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 246
LDI r2, 439
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
