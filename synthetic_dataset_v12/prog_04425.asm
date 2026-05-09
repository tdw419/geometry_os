; DESCRIPTION: Composite: Draws a red circle centered at (223, 170) with radius 49 then Renders a red box of size 89x104 starting at (306, 40).
; PLAN: r0=223(x), r1=170(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=40(y), r7=89(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 170
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 40
LDI r7, 89
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
