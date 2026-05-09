; DESCRIPTION: Composite: Places a orange dot at position (327, 246) then Places a blue circle of radius 71 at center (73, 175) then Places a black 90x14 rectangle at position (295, 11).
; PLAN: r0=327(x), r1=246(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=175(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=11(y), r12=90(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 246
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 73
LDI r6, 175
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 11
LDI r12, 90
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
