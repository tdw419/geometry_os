; DESCRIPTION: Composite: Renders a magenta box of size 78x49 starting at (260, 122) then Creates a magenta circular shape at (83, 183) with radius 60.
; PLAN: r0=260(x), r1=122(y), r2=78(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x), r6=183(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 122
LDI r2, 78
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 183
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
