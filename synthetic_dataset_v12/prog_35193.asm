; DESCRIPTION: Composite: Renders a red box of size 31x12 starting at (250, 155) then Places a orange circle of radius 34 at center (68, 201).
; PLAN: r0=250(x), r1=155(y), r2=31(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=201(y), r7=34(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 155
LDI r2, 31
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 201
LDI r7, 34
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
