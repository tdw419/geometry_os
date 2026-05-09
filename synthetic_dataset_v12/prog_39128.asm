; DESCRIPTION: Composite: Sets a single red pixel at (133, 76) then Places a red circle of radius 70 at center (365, 112) then Creates a green rectangular region at (109, 49) spanning 104 by 70 pixels.
; PLAN: r0=133(x), r1=76(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=112(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x), r11=49(y), r12=104(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 76
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 112
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 49
LDI r12, 104
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
