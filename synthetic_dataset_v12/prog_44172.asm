; DESCRIPTION: Renders a orange line between points (244, 147) and (30, 50).
; PLAN: r0=244(x1), r1=147(y1), r2=30(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 147
LDI r2, 30
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
