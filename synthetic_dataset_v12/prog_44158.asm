; DESCRIPTION: Composite: Draws a black rectangle at (56, 70) with width 14 and height 96 then Places a green circle of radius 19 at center (217, 114) then Places a white dot at position (190, 60).
; PLAN: r0=56(x), r1=70(y), r2=14(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=114(y), r7=19(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=190(x), r11=60(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 56
LDI r1, 70
LDI r2, 14
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 114
LDI r7, 19
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 190
LDI r11, 60
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
