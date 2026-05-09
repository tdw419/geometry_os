; DESCRIPTION: Composite: Renders a black box of size 59x118 starting at (381, 60) then Places a blue circle of radius 40 at center (460, 88).
; PLAN: r0=381(x), r1=60(y), r2=59(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=88(y), r7=40(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 381
LDI r1, 60
LDI r2, 59
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 88
LDI r7, 40
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
