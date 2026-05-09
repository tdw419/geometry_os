; DESCRIPTION: Draws a red line from (236, 167) to (439, 67).
; PLAN: r0=236(x1), r1=167(y1), r2=439(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 167
LDI r2, 439
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
