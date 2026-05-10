; DESCRIPTION: Composite: Renders a black box of size 50x88 starting at (457, 24) then Places a magenta circle of radius 27 at center (85, 125).
; PLAN: r0=457(x), r1=24(y), r2=50(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=125(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 24
LDI r2, 50
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 125
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
