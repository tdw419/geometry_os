; DESCRIPTION: Composite: Creates a white rectangular region at (282, 17) spanning 60 by 20 pixels then Places a yellow circle of radius 44 at center (260, 167).
; PLAN: r0=282(x), r1=17(y), r2=60(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=167(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 282
LDI r1, 17
LDI r2, 60
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 167
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
