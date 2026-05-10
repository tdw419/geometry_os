; DESCRIPTION: Composite: Creates a white circular shape at (353, 90) with radius 75 then Renders a white box of size 98x84 starting at (322, 88).
; PLAN: r0=353(x), r1=90(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=88(y), r7=98(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 90
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 88
LDI r7, 98
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
