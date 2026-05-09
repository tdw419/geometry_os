; DESCRIPTION: Composite: Draws a blue rectangle at (133, 92) with width 96 and height 38 then Renders a black line between points (359, 237) and (190, 115) then Places a purple dot at position (14, 129).
; PLAN: r0=133(x), r1=92(y), r2=96(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=237(y1), r7=190(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=14(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 92
LDI r2, 96
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 237
LDI r7, 190
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
