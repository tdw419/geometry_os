; DESCRIPTION: Composite: Places a black circle of radius 13 at center (237, 96) then Draws a red rectangle at (253, 38) with width 46 and height 29 then Places a purple dot at position (209, 129).
; PLAN: r0=237(x), r1=96(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=38(y), r7=46(width), r8=29(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 96
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 38
LDI r7, 46
LDI r8, 29
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
