; DESCRIPTION: Composite: Creates a red circular shape at (94, 148) with radius 24 then Renders a blue box of size 93x69 starting at (56, 147).
; PLAN: r0=94(x), r1=148(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=147(y), r7=93(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 148
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 147
LDI r7, 93
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
