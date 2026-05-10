; DESCRIPTION: Composite: Places a orange dot at position (50, 218) then Renders a green box of size 32x112 starting at (426, 45) then Draws a blue circle centered at (300, 62) with radius 24.
; PLAN: r0=50(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=45(y), r7=32(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=62(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 50
LDI r1, 218
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 426
LDI r6, 45
LDI r7, 32
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 62
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
