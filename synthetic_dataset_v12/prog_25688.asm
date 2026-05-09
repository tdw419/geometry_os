; DESCRIPTION: Composite: Places a blue circle of radius 37 at center (414, 216) then Creates a black rectangular region at (192, 37) spanning 43 by 85 pixels.
; PLAN: r0=414(x), r1=216(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=37(y), r7=43(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 216
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 37
LDI r7, 43
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
