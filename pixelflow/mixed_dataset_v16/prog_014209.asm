; DESCRIPTION: Renders a green line between points (376, 116) and (476, 252).
; PLAN: r0=376(x1), r1=116(y1), r2=476(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 116
LDI r2, 476
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
