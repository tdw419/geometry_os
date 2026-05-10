; DESCRIPTION: Composite: Renders a orange disk with center (413, 176) and radius 62 then Creates a white rectangular region at (158, 181) spanning 44 by 34 pixels.
; PLAN: r0=413(x), r1=176(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=181(y), r7=44(width), r8=34(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 176
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 181
LDI r7, 44
LDI r8, 34
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
