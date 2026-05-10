; DESCRIPTION: Composite: Draws a purple rectangle at (236, 11) with width 65 and height 116 then Places a white line segment connecting (268, 238) to (472, 112) then Sets a single purple pixel at (379, 236).
; PLAN: r0=236(x), r1=11(y), r2=65(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x1), r6=238(y1), r7=472(x2), r8=112(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=236(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 11
LDI r2, 65
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 238
LDI r7, 472
LDI r8, 112
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 236
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
