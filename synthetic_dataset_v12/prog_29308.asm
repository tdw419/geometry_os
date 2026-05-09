; DESCRIPTION: Composite: Draws a purple circle centered at (172, 152) with radius 44 then Creates a black rectangular region at (273, 67) spanning 101 by 80 pixels.
; PLAN: r0=172(x), r1=152(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=67(y), r7=101(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 152
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 67
LDI r7, 101
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
