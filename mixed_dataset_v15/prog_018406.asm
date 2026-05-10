; DESCRIPTION: Composite: Renders a black disk with center (87, 129) and radius 44 then Renders a blue box of size 59x30 starting at (339, 69).
; PLAN: r0=87(x), r1=129(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=69(y), r7=59(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 129
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 69
LDI r7, 59
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
