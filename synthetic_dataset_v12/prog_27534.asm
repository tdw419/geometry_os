; DESCRIPTION: Draws a green line from (412, 92) to (116, 188).
; PLAN: r0=412(x1), r1=92(y1), r2=116(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 92
LDI r2, 116
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
