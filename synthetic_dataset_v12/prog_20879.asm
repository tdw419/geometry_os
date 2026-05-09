; DESCRIPTION: Draws a yellow line from (343, 195) to (451, 199).
; PLAN: r0=343(x1), r1=195(y1), r2=451(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 195
LDI r2, 451
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
