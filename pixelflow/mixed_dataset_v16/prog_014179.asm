; DESCRIPTION: Draws a red line from (341, 157) to (236, 83).
; PLAN: r0=341(x1), r1=157(y1), r2=236(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 157
LDI r2, 236
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
