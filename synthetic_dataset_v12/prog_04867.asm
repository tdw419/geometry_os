; DESCRIPTION: Composite: Creates a magenta circular shape at (51, 137) with radius 22 then Renders a yellow box of size 76x67 starting at (340, 105).
; PLAN: r0=51(x), r1=137(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=105(y), r7=76(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 137
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 105
LDI r7, 76
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
