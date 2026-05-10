; DESCRIPTION: Composite: Renders a white disk with center (194, 155) and radius 32 then Renders a green box of size 110x84 starting at (377, 164).
; PLAN: r0=194(x), r1=155(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=164(y), r7=110(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 155
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 164
LDI r7, 110
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
