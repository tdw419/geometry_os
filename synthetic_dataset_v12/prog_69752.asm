; DESCRIPTION: Draws a magenta line from (257, 161) to (223, 240).
; PLAN: r0=257(x1), r1=161(y1), r2=223(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 161
LDI r2, 223
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
