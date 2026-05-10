; DESCRIPTION: Composite: Places a magenta dot at position (432, 73) then Creates a magenta circular shape at (209, 113) with radius 49 then Creates a black rectangular region at (443, 118) spanning 56 by 89 pixels.
; PLAN: r0=432(x), r1=73(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=113(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x), r11=118(y), r12=56(width), r13=89(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 73
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 113
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 118
LDI r12, 56
LDI r13, 89
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
