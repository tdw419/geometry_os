; DESCRIPTION: Draws a yellow line from (447, 43) to (361, 66).
; PLAN: r0=447(x1), r1=43(y1), r2=361(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 43
LDI r2, 361
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
