; DESCRIPTION: Renders a green line between points (257, 44) and (296, 229).
; PLAN: r0=257(x1), r1=44(y1), r2=296(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 44
LDI r2, 296
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
