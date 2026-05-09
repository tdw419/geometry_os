; DESCRIPTION: Composite: Renders a green box of size 119x68 starting at (23, 167) then Creates a orange circular shape at (274, 117) with radius 63.
; PLAN: r0=23(x), r1=167(y), r2=119(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=117(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 167
LDI r2, 119
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 117
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
