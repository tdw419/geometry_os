; DESCRIPTION: Composite: Draws a purple rectangle at (153, 36) with width 17 and height 52 then Places a magenta circle of radius 33 at center (275, 212).
; PLAN: r0=153(x), r1=36(y), r2=17(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=212(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 36
LDI r2, 17
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 212
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
