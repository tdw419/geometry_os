; DESCRIPTION: Renders a white line between points (427, 248) and (8, 102).
; PLAN: r0=427(x1), r1=248(y1), r2=8(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 248
LDI r2, 8
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
