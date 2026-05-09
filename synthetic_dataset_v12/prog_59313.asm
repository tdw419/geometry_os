; DESCRIPTION: Composite: Places a magenta dot at position (451, 10) then Creates a blue circular shape at (230, 200) with radius 48 then Draws a cyan rectangle at (166, 170) with width 118 and height 63.
; PLAN: r0=451(x), r1=10(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=200(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=166(x), r11=170(y), r12=118(width), r13=63(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 10
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 200
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 166
LDI r11, 170
LDI r12, 118
LDI r13, 63
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
