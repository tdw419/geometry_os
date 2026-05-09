; DESCRIPTION: Composite: Creates a yellow circular shape at (375, 33) with radius 19 then Renders a black box of size 70x51 starting at (170, 147).
; PLAN: r0=375(x), r1=33(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=147(y), r7=70(width), r8=51(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 33
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 147
LDI r7, 70
LDI r8, 51
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
