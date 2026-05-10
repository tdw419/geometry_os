; DESCRIPTION: Composite: Draws a purple rectangle at (384, 235) with width 41 and height 18 then Places a cyan dot at position (319, 184) then Places a blue circle of radius 26 at center (175, 216).
; PLAN: r0=384(x), r1=235(y), r2=41(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=184(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=175(x), r11=216(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 235
LDI r2, 41
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 184
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 175
LDI r11, 216
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
