; DESCRIPTION: Composite: Places a blue dot at position (475, 117) then Draws a red rectangle at (457, 151) with width 31 and height 36 then Creates a blue circular shape at (306, 130) with radius 54.
; PLAN: r0=475(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=151(y), r7=31(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x), r11=130(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 117
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 151
LDI r7, 31
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 130
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
