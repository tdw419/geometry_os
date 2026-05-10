; DESCRIPTION: Composite: Renders a orange disk with center (107, 62) and radius 22 then Creates a green rectangular region at (254, 79) spanning 74 by 43 pixels.
; PLAN: r0=107(x), r1=62(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=79(y), r7=74(width), r8=43(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 62
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 79
LDI r7, 74
LDI r8, 43
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
