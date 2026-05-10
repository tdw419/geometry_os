; DESCRIPTION: Composite: Renders a green box of size 112x73 starting at (252, 25) then Places a magenta circle of radius 39 at center (141, 179).
; PLAN: r0=252(x), r1=25(y), r2=112(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=179(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 252
LDI r1, 25
LDI r2, 112
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 179
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
