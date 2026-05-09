; DESCRIPTION: Composite: Sets a single green pixel at (426, 72) then Draws a magenta rectangle at (311, 148) with width 47 and height 90 then Draws a red circle centered at (287, 189) with radius 52.
; PLAN: r0=426(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=311(x), r6=148(y), r7=47(width), r8=90(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x), r11=189(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 311
LDI r6, 148
LDI r7, 47
LDI r8, 90
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 189
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
