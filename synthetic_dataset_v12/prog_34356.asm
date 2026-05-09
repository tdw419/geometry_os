; DESCRIPTION: Composite: Places a orange dot at position (356, 115) then Draws a red circle centered at (430, 142) with radius 77 then Creates a green rectangular region at (8, 49) spanning 100 by 55 pixels.
; PLAN: r0=356(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=430(x), r6=142(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=49(y), r12=100(width), r13=55(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 430
LDI r6, 142
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 49
LDI r12, 100
LDI r13, 55
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
