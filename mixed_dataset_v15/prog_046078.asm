; DESCRIPTION: Composite: Creates a black circular shape at (371, 98) with radius 58 then Renders a green box of size 84x23 starting at (256, 17).
; PLAN: r0=371(x), r1=98(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=17(y), r7=84(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 98
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 17
LDI r7, 84
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
