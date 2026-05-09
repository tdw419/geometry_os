; DESCRIPTION: Draws a red line from (447, 215) to (136, 163).
; PLAN: r0=447(x1), r1=215(y1), r2=136(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 215
LDI r2, 136
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
