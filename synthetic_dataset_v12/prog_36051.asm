; DESCRIPTION: Composite: Creates a yellow rectangular region at (12, 62) spanning 106 by 18 pixels then Places a white circle of radius 67 at center (326, 138).
; PLAN: r0=12(x), r1=62(y), r2=106(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=138(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 62
LDI r2, 106
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 138
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
