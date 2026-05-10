; DESCRIPTION: Composite: Creates a cyan rectangular region at (293, 145) spanning 88 by 67 pixels then Creates a black circular shape at (143, 129) with radius 23.
; PLAN: r0=293(x), r1=145(y), r2=88(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=129(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 145
LDI r2, 88
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 129
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
