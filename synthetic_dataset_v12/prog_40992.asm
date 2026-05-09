; DESCRIPTION: Renders a blue line between points (50, 155) and (257, 252).
; PLAN: r0=50(x1), r1=155(y1), r2=257(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 155
LDI r2, 257
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
