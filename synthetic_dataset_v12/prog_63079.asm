; DESCRIPTION: Composite: Creates a blue circular shape at (371, 84) with radius 68 then Sets a single cyan pixel at (139, 40) then Draws a blue rectangle at (395, 127) with width 32 and height 33.
; PLAN: r0=371(x), r1=84(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=40(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=395(x), r11=127(y), r12=32(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 84
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 40
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 395
LDI r11, 127
LDI r12, 32
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
