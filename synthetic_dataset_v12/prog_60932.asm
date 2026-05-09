; DESCRIPTION: Renders a green line between points (282, 15) and (10, 184).
; PLAN: r0=282(x1), r1=15(y1), r2=10(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 15
LDI r2, 10
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
