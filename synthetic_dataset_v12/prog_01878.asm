; DESCRIPTION: Composite: Renders a black disk with center (427, 108) and radius 38 then Creates a black rectangular region at (58, 41) spanning 102 by 62 pixels.
; PLAN: r0=427(x), r1=108(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=41(y), r7=102(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 108
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 41
LDI r7, 102
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
