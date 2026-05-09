; DESCRIPTION: Renders a green line between points (184, 145) and (200, 246).
; PLAN: r0=184(x1), r1=145(y1), r2=200(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 145
LDI r2, 200
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
