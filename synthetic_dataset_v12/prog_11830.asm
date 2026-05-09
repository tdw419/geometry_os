; DESCRIPTION: Composite: Places a white 33x86 rectangle at position (78, 169) then Renders a purple line between points (175, 73) and (83, 105) then Sets a single white pixel at (503, 211).
; PLAN: r0=78(x), r1=169(y), r2=33(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=73(y1), r7=83(x2), r8=105(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=211(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 169
LDI r2, 33
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 73
LDI r7, 83
LDI r8, 105
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 211
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
