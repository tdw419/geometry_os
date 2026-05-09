; DESCRIPTION: Composite: Renders a orange disk with center (46, 105) and radius 18 then Creates a red rectangular region at (321, 61) spanning 38 by 119 pixels.
; PLAN: r0=46(x), r1=105(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x), r6=61(y), r7=38(width), r8=119(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 105
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 61
LDI r7, 38
LDI r8, 119
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
