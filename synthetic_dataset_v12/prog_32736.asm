; DESCRIPTION: Draws a black line from (447, 186) to (2, 246).
; PLAN: r0=447(x1), r1=186(y1), r2=2(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 186
LDI r2, 2
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
