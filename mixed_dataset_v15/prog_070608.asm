; DESCRIPTION: Renders a orange line between points (146, 170) and (361, 95).
; PLAN: r0=146(x1), r1=170(y1), r2=361(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 170
LDI r2, 361
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
