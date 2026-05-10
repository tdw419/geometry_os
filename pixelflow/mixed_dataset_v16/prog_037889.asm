; DESCRIPTION: Draws a magenta line from (233, 27) to (257, 159).
; PLAN: r0=233(x1), r1=27(y1), r2=257(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 27
LDI r2, 257
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
