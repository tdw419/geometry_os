; DESCRIPTION: Renders a orange line between points (184, 95) and (399, 241).
; PLAN: r0=184(x1), r1=95(y1), r2=399(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 95
LDI r2, 399
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
