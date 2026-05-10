; DESCRIPTION: Composite: Places a orange dot at position (225, 17) then Places a black circle of radius 31 at center (432, 42) then Draws a orange line from (426, 121) to (494, 228).
; PLAN: r0=225(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=42(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=426(x1), r11=121(y1), r12=494(x2), r13=228(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 17
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 432
LDI r6, 42
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 426
LDI r11, 121
LDI r12, 494
LDI r13, 228
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
