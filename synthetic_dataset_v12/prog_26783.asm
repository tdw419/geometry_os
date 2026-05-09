; DESCRIPTION: Composite: Places a yellow circle of radius 24 at center (362, 191) then Draws a purple rectangle at (16, 43) with width 65 and height 44 then Places a green dot at position (285, 190).
; PLAN: r0=362(x), r1=191(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=43(y), r7=65(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=190(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 191
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 43
LDI r7, 65
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 190
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
