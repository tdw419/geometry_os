; DESCRIPTION: Composite: Renders a magenta disk with center (109, 159) and radius 47 then Renders a green box of size 45x81 starting at (167, 7).
; PLAN: r0=109(x), r1=159(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x), r6=7(y), r7=45(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 159
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 7
LDI r7, 45
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
