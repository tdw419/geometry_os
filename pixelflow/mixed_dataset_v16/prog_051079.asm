; DESCRIPTION: Composite: Sets a single black pixel at (287, 51) then Renders a black box of size 11x27 starting at (261, 158) then Places a purple circle of radius 76 at center (209, 108).
; PLAN: r0=287(x), r1=51(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=158(y), r7=11(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=108(y), r12=76(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 51
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 261
LDI r6, 158
LDI r7, 11
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 108
LDI r12, 76
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
