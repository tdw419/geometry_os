; DESCRIPTION: Draws a red line from (236, 67) to (92, 183).
; PLAN: r0=236(x1), r1=67(y1), r2=92(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 67
LDI r2, 92
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
