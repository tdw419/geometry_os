; DESCRIPTION: Composite: Places a yellow dot at position (425, 181) then Draws a blue rectangle at (384, 21) with width 43 and height 37 then Places a purple circle of radius 46 at center (438, 208).
; PLAN: r0=425(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=384(x), r6=21(y), r7=43(width), r8=37(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=208(y), r12=46(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 425
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 384
LDI r6, 21
LDI r7, 43
LDI r8, 37
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 208
LDI r12, 46
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
