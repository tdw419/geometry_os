; DESCRIPTION: Composite: Sets a single black pixel at (109, 171) then Creates a green circular shape at (427, 120) with radius 69 then Creates a purple rectangular region at (331, 141) spanning 66 by 48 pixels.
; PLAN: r0=109(x), r1=171(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=120(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=331(x), r11=141(y), r12=66(width), r13=48(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 171
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 427
LDI r6, 120
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 331
LDI r11, 141
LDI r12, 66
LDI r13, 48
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
