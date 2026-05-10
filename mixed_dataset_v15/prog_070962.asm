; DESCRIPTION: Composite: Sets a single yellow pixel at (451, 189) then Draws a magenta rectangle at (237, 150) with width 80 and height 101 then Places a purple circle of radius 15 at center (372, 20).
; PLAN: r0=451(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=237(x), r6=150(y), r7=80(width), r8=101(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x), r11=20(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 451
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 237
LDI r6, 150
LDI r7, 80
LDI r8, 101
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 20
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
