; DESCRIPTION: Composite: Renders a blue disk with center (98, 214) and radius 18 then Creates a black rectangular region at (230, 117) spanning 40 by 22 pixels.
; PLAN: r0=98(x), r1=214(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=117(y), r7=40(width), r8=22(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 214
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 117
LDI r7, 40
LDI r8, 22
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
