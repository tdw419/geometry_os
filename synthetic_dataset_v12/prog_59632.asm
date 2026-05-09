; DESCRIPTION: Draws a yellow line from (257, 190) to (68, 168).
; PLAN: r0=257(x1), r1=190(y1), r2=68(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 190
LDI r2, 68
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
