; DESCRIPTION: Composite: Renders a orange disk with center (407, 163) and radius 66 then Renders a blue box of size 76x30 starting at (128, 18).
; PLAN: r0=407(x), r1=163(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x), r6=18(y), r7=76(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 163
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 18
LDI r7, 76
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
