; DESCRIPTION: Renders a white line between points (153, 247) and (128, 147).
; PLAN: r0=153(x1), r1=247(y1), r2=128(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 247
LDI r2, 128
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
