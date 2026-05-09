; DESCRIPTION: Composite: Sets a single green pixel at (487, 136) then Creates a orange rectangular region at (299, 110) spanning 19 by 110 pixels then Creates a white circular shape at (362, 98) with radius 80.
; PLAN: r0=487(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=110(y), r7=19(width), r8=110(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=362(x), r11=98(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 487
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 110
LDI r7, 19
LDI r8, 110
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 98
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
