; DESCRIPTION: Composite: Creates a black circular shape at (127, 227) with radius 15 then Places a purple dot at position (239, 71) then Creates a cyan rectangular region at (73, 103) spanning 89 by 77 pixels.
; PLAN: r0=127(x), r1=227(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=71(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=103(y), r12=89(width), r13=77(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 227
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 71
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 103
LDI r12, 89
LDI r13, 77
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
