; DESCRIPTION: Composite: Creates a yellow rectangular region at (282, 79) spanning 61 by 18 pixels then Renders a white line between points (101, 55) and (382, 101) then Sets a single blue pixel at (169, 73).
; PLAN: r0=282(x), r1=79(y), r2=61(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=55(y1), r7=382(x2), r8=101(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=73(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 79
LDI r2, 61
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 55
LDI r7, 382
LDI r8, 101
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 73
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
