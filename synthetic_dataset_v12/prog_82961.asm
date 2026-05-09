; DESCRIPTION: Draws a yellow line from (447, 167) to (25, 218).
; PLAN: r0=447(x1), r1=167(y1), r2=25(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 167
LDI r2, 25
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
