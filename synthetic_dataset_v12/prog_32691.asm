; DESCRIPTION: Composite: Sets a single black pixel at (55, 157) then Creates a blue circular shape at (265, 45) with radius 45 then Renders a black box of size 80x22 starting at (75, 14).
; PLAN: r0=55(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=45(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=14(y), r12=80(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 265
LDI r6, 45
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 14
LDI r12, 80
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
