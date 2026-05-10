; DESCRIPTION: Draws a yellow line from (116, 72) to (379, 148).
; PLAN: r0=116(x1), r1=72(y1), r2=379(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 72
LDI r2, 379
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
