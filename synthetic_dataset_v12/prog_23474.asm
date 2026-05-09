; DESCRIPTION: Composite: Sets a single green pixel at (250, 75) then Draws a white circle centered at (474, 76) with radius 18 then Creates a green rectangular region at (186, 148) spanning 78 by 54 pixels.
; PLAN: r0=250(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=474(x), r6=76(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=148(y), r12=78(width), r13=54(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 474
LDI r6, 76
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 148
LDI r12, 78
LDI r13, 54
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
