; DESCRIPTION: Draws a yellow line from (447, 233) to (274, 132).
; PLAN: r0=447(x1), r1=233(y1), r2=274(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 233
LDI r2, 274
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
