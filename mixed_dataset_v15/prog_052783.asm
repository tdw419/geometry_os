; DESCRIPTION: Composite: Draws a purple rectangle at (22, 64) with width 90 and height 26 then Renders a white line between points (511, 116) and (20, 146) then Sets a single white pixel at (119, 115).
; PLAN: r0=22(x), r1=64(y), r2=90(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x1), r6=116(y1), r7=20(x2), r8=146(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=119(x), r11=115(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 64
LDI r2, 90
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 116
LDI r7, 20
LDI r8, 146
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 115
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
