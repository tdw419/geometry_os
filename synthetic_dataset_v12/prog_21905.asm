; DESCRIPTION: Draws a red line from (447, 206) to (84, 7).
; PLAN: r0=447(x1), r1=206(y1), r2=84(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 206
LDI r2, 84
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
