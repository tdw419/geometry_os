; DESCRIPTION: Composite: Places a green dot at position (19, 0) then Draws a blue rectangle at (89, 130) with width 77 and height 29 then Places a red circle of radius 37 at center (323, 49).
; PLAN: r0=19(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=130(y), r7=77(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=323(x), r11=49(y), r12=37(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 130
LDI r7, 77
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 49
LDI r12, 37
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
