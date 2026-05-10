; DESCRIPTION: Composite: Draws a magenta circle centered at (309, 93) with radius 71 then Renders a green box of size 101x26 starting at (199, 191).
; PLAN: r0=309(x), r1=93(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=191(y), r7=101(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 93
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 191
LDI r7, 101
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
