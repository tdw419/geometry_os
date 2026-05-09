; DESCRIPTION: Renders a black line between points (376, 57) and (215, 147).
; PLAN: r0=376(x1), r1=57(y1), r2=215(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 57
LDI r2, 215
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
