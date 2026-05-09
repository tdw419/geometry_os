; DESCRIPTION: Composite: Renders a black box of size 26x35 starting at (299, 151) then Places a orange circle of radius 67 at center (274, 125) then Sets a single blue pixel at (458, 143).
; PLAN: r0=299(x), r1=151(y), r2=26(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=125(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=458(x), r11=143(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 151
LDI r2, 26
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 125
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 458
LDI r11, 143
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
