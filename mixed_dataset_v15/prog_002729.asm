; DESCRIPTION: Composite: Places a orange dot at position (212, 227) then Draws a green circle centered at (62, 213) with radius 40 then Draws a magenta rectangle at (235, 10) with width 77 and height 21.
; PLAN: r0=212(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=213(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=10(y), r12=77(width), r13=21(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 62
LDI r6, 213
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 10
LDI r12, 77
LDI r13, 21
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
