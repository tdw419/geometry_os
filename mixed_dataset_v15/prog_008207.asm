; DESCRIPTION: Composite: Sets a single yellow pixel at (430, 120) then Creates a black circular shape at (90, 76) with radius 53 then Renders a cyan box of size 88x11 starting at (246, 194).
; PLAN: r0=430(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=76(y), r7=53(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=246(x), r11=194(y), r12=88(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 90
LDI r6, 76
LDI r7, 53
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 246
LDI r11, 194
LDI r12, 88
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
