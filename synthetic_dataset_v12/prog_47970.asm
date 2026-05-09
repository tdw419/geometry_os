; DESCRIPTION: Renders a black line between points (376, 58) and (336, 58).
; PLAN: r0=376(x1), r1=58(y1), r2=336(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 58
LDI r2, 336
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
