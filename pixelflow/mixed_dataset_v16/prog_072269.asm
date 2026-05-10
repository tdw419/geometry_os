; DESCRIPTION: Composite: Sets a single blue pixel at (450, 140) then Draws a yellow rectangle at (160, 38) with width 55 and height 56 then Draws a yellow circle centered at (350, 26) with radius 16.
; PLAN: r0=450(x), r1=140(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=38(y), r7=55(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x), r11=26(y), r12=16(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 140
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 38
LDI r7, 55
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 26
LDI r12, 16
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
