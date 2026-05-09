; DESCRIPTION: Renders a magenta line between points (257, 249) and (301, 118).
; PLAN: r0=257(x1), r1=249(y1), r2=301(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 249
LDI r2, 301
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
