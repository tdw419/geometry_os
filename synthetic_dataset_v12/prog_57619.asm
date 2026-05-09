; DESCRIPTION: Composite: Renders a white line between points (278, 238) and (83, 81) then Creates a black rectangular region at (227, 71) spanning 118 by 19 pixels.
; PLAN: r0=278(x1), r1=238(y1), r2=83(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=71(y), r7=118(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 238
LDI r2, 83
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 71
LDI r7, 118
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
