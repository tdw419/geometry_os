; DESCRIPTION: Composite: Renders a yellow disk with center (239, 97) and radius 55 then Creates a green rectangular region at (29, 105) spanning 105 by 12 pixels.
; PLAN: r0=239(x), r1=97(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=105(y), r7=105(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 97
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 105
LDI r7, 105
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
