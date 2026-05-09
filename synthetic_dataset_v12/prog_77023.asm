; DESCRIPTION: Composite: Sets a single blue pixel at (419, 207) then Draws a yellow rectangle at (152, 94) with width 90 and height 94 then Creates a yellow circular shape at (101, 156) with radius 63.
; PLAN: r0=419(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=94(y), r7=90(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x), r11=156(y), r12=63(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 94
LDI r7, 90
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 156
LDI r12, 63
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
