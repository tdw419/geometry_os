; DESCRIPTION: Draws a yellow line from (447, 79) to (330, 159).
; PLAN: r0=447(x1), r1=79(y1), r2=330(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 79
LDI r2, 330
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
