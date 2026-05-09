; DESCRIPTION: Composite: Creates a orange rectangular region at (447, 60) spanning 62 by 30 pixels then Renders a green disk with center (426, 211) and radius 36.
; PLAN: r0=447(x), r1=60(y), r2=62(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=211(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 447
LDI r1, 60
LDI r2, 62
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 211
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
