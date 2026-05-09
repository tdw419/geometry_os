; DESCRIPTION: Renders a magenta line between points (233, 165) and (257, 218).
; PLAN: r0=233(x1), r1=165(y1), r2=257(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 165
LDI r2, 257
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
