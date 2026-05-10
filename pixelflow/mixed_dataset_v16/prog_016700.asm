; DESCRIPTION: Composite: Creates a orange circular shape at (311, 191) with radius 31 then Renders a white box of size 102x45 starting at (96, 80) then Places a purple line segment connecting (492, 17) to (373, 0).
; PLAN: r0=311(x), r1=191(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=80(y), r7=102(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x1), r11=17(y1), r12=373(x2), r13=0(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 191
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 80
LDI r7, 102
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 17
LDI r12, 373
LDI r13, 0
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
