; DESCRIPTION: Composite: Renders a white disk with center (418, 29) and radius 16 then Renders a blue box of size 21x114 starting at (77, 5).
; PLAN: r0=418(x), r1=29(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=5(y), r7=21(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 29
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 5
LDI r7, 21
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
