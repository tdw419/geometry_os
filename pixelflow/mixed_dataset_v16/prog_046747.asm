; DESCRIPTION: Renders a orange line between points (439, 223) and (383, 52).
; PLAN: r0=439(x1), r1=223(y1), r2=383(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 223
LDI r2, 383
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
