; DESCRIPTION: Composite: Creates a magenta circular shape at (105, 78) with radius 64 then Renders a blue box of size 32x83 starting at (270, 134).
; PLAN: r0=105(x), r1=78(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=134(y), r7=32(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 78
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 134
LDI r7, 32
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
