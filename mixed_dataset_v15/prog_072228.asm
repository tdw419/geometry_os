; DESCRIPTION: Composite: Draws a purple rectangle at (185, 50) with width 83 and height 90 then Renders a cyan line between points (435, 189) and (200, 122) then Sets a single black pixel at (259, 219).
; PLAN: r0=185(x), r1=50(y), r2=83(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=189(y1), r7=200(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=219(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 50
LDI r2, 83
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 189
LDI r7, 200
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 219
LDI r12, 0x000000
PSET r10, r11, r12
HALT
