; DESCRIPTION: Composite: Renders a green box of size 18x11 starting at (450, 227) then Renders a green disk with center (439, 128) and radius 69.
; PLAN: r0=450(x), r1=227(y), r2=18(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=128(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 450
LDI r1, 227
LDI r2, 18
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 128
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
