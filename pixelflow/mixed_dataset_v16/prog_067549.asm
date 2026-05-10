; DESCRIPTION: Composite: Sets a single blue pixel at (158, 106) then Draws a magenta rectangle at (269, 221) with width 94 and height 24 then Renders a orange disk with center (239, 68) and radius 26.
; PLAN: r0=158(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=221(y), r7=94(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=68(y), r12=26(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 221
LDI r7, 94
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 68
LDI r12, 26
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
