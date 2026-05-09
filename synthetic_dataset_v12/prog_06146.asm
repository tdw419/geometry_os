; DESCRIPTION: Renders a green line between points (471, 199) and (402, 167).
; PLAN: r0=471(x1), r1=199(y1), r2=402(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 199
LDI r2, 402
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
