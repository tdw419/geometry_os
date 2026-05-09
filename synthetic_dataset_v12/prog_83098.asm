; DESCRIPTION: Composite: Sets a single purple pixel at (48, 109) then Creates a blue rectangular region at (57, 201) spanning 74 by 21 pixels then Creates a yellow circular shape at (403, 185) with radius 56.
; PLAN: r0=48(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=201(y), r7=74(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=403(x), r11=185(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 201
LDI r7, 74
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 185
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
