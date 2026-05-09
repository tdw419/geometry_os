; DESCRIPTION: Renders a red line between points (476, 63) and (472, 31).
; PLAN: r0=476(x1), r1=63(y1), r2=472(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 63
LDI r2, 472
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
