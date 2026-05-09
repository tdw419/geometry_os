; DESCRIPTION: Composite: Renders a green box of size 101x61 starting at (109, 78) then Places a green circle of radius 54 at center (174, 191).
; PLAN: r0=109(x), r1=78(y), r2=101(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=191(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 78
LDI r2, 101
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 191
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
