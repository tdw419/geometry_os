; DESCRIPTION: Composite: Sets a single purple pixel at (506, 39) then Places a yellow 96x48 rectangle at position (166, 72) then Places a black circle of radius 41 at center (296, 62).
; PLAN: r0=506(x), r1=39(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=72(y), r7=96(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=62(y), r12=41(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 506
LDI r1, 39
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 72
LDI r7, 96
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 62
LDI r12, 41
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
