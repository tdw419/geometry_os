; DESCRIPTION: Renders a black line between points (466, 233) and (376, 249).
; PLAN: r0=466(x1), r1=233(y1), r2=376(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 233
LDI r2, 376
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
