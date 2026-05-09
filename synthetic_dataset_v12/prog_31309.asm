; DESCRIPTION: Composite: Creates a magenta circular shape at (350, 157) with radius 16 then Creates a blue rectangular region at (310, 18) spanning 59 by 96 pixels then Places a green dot at position (285, 36).
; PLAN: r0=350(x), r1=157(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=18(y), r7=59(width), r8=96(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=36(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 157
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 18
LDI r7, 59
LDI r8, 96
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 36
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
