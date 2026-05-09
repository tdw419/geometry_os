; DESCRIPTION: Composite: Draws a purple circle centered at (440, 176) with radius 34 then Places a yellow dot at position (226, 140) then Places a white 78x24 rectangle at position (211, 126).
; PLAN: r0=440(x), r1=176(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=226(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=126(y), r12=78(width), r13=24(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 176
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 226
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 211
LDI r11, 126
LDI r12, 78
LDI r13, 24
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
