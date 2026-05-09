; DESCRIPTION: Renders a orange line between points (137, 179) and (184, 16).
; PLAN: r0=137(x1), r1=179(y1), r2=184(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 179
LDI r2, 184
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
