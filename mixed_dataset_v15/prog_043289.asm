; DESCRIPTION: Draws a yellow line from (257, 113) to (363, 140).
; PLAN: r0=257(x1), r1=113(y1), r2=363(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 113
LDI r2, 363
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
