; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (255, 109) then Draws a purple rectangle at (217, 119) with width 26 and height 59 then Places a red dot at position (190, 159).
; PLAN: r0=255(x), r1=109(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=119(y), r7=26(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=190(x), r11=159(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 109
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 119
LDI r7, 26
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 159
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
