; DESCRIPTION: Composite: Sets a single black pixel at (287, 123) then Renders a red box of size 24x41 starting at (343, 67) then Places a magenta circle of radius 76 at center (111, 144).
; PLAN: r0=287(x), r1=123(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=67(y), r7=24(width), r8=41(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=144(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 123
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 343
LDI r6, 67
LDI r7, 24
LDI r8, 41
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 144
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
