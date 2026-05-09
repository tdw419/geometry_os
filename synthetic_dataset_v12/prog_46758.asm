; DESCRIPTION: Draws a red line from (368, 248) to (285, 158).
; PLAN: r0=368(x1), r1=248(y1), r2=285(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 248
LDI r2, 285
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
