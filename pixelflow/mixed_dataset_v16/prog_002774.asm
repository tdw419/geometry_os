; DESCRIPTION: Composite: Sets a single orange pixel at (337, 170) then Renders a blue box of size 42x28 starting at (184, 25) then Draws a green circle centered at (399, 85) with radius 49.
; PLAN: r0=337(x), r1=170(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=25(y), r7=42(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=399(x), r11=85(y), r12=49(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 337
LDI r1, 170
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 184
LDI r6, 25
LDI r7, 42
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 85
LDI r12, 49
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
