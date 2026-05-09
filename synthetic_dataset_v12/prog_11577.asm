; DESCRIPTION: Renders a white line between points (395, 39) and (257, 247).
; PLAN: r0=395(x1), r1=39(y1), r2=257(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 39
LDI r2, 257
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
