; DESCRIPTION: Composite: Draws a green circle centered at (264, 86) with radius 13 then Places a white dot at position (498, 142) then Places a blue 107x24 rectangle at position (110, 94).
; PLAN: r0=264(x), r1=86(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=142(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=94(y), r12=107(width), r13=24(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 86
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 142
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 94
LDI r12, 107
LDI r13, 24
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
