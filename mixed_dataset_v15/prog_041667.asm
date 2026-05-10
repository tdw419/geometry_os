; DESCRIPTION: Composite: Draws a green rectangle at (248, 74) with width 71 and height 80 then Places a white dot at position (0, 217) then Places a white circle of radius 63 at center (120, 151).
; PLAN: r0=248(x), r1=74(y), r2=71(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=217(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=120(x), r11=151(y), r12=63(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 74
LDI r2, 71
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 217
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 120
LDI r11, 151
LDI r12, 63
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
