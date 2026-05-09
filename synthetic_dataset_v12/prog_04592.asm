; DESCRIPTION: Renders a yellow line between points (501, 111) and (257, 85).
; PLAN: r0=501(x1), r1=111(y1), r2=257(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 111
LDI r2, 257
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
