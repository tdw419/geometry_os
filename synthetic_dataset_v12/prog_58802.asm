; DESCRIPTION: Renders a yellow line between points (376, 45) and (29, 235).
; PLAN: r0=376(x1), r1=45(y1), r2=29(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 45
LDI r2, 29
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
