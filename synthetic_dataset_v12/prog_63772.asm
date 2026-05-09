; DESCRIPTION: Renders a white line between points (257, 52) and (357, 39).
; PLAN: r0=257(x1), r1=52(y1), r2=357(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 52
LDI r2, 357
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
