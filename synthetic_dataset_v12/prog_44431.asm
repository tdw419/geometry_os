; DESCRIPTION: Renders a orange line between points (34, 24) and (511, 32).
; PLAN: r0=34(x1), r1=24(y1), r2=511(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 24
LDI r2, 511
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
