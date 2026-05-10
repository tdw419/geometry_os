; DESCRIPTION: Composite: Places a yellow dot at position (57, 3) then Draws a yellow rectangle at (245, 165) with width 60 and height 12 then Places a green circle of radius 17 at center (484, 82).
; PLAN: r0=57(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=165(y), r7=60(width), r8=12(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=82(y), r12=17(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 245
LDI r6, 165
LDI r7, 60
LDI r8, 12
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 82
LDI r12, 17
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
