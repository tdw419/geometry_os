; DESCRIPTION: Composite: Creates a black circular shape at (320, 181) with radius 68 then Renders a cyan box of size 66x66 starting at (163, 56).
; PLAN: r0=320(x), r1=181(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=56(y), r7=66(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 181
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 56
LDI r7, 66
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
