; DESCRIPTION: Composite: Draws a cyan rectangle at (24, 3) with width 24 and height 92 then Places a purple circle of radius 38 at center (232, 127) then Places a red dot at position (436, 188).
; PLAN: r0=24(x), r1=3(y), r2=24(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=127(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=188(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 3
LDI r2, 24
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 127
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 188
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
