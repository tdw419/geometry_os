; DESCRIPTION: Composite: Renders a orange box of size 62x43 starting at (212, 20) then Places a magenta circle of radius 64 at center (289, 162).
; PLAN: r0=212(x), r1=20(y), r2=62(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=162(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 20
LDI r2, 62
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 162
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
