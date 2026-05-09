; DESCRIPTION: Draws a yellow line from (36, 105) to (257, 216).
; PLAN: r0=36(x1), r1=105(y1), r2=257(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 105
LDI r2, 257
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
