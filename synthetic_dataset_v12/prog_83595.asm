; DESCRIPTION: Composite: Places a black dot at position (378, 10) then Creates a yellow circular shape at (319, 140) with radius 30 then Places a purple 31x77 rectangle at position (117, 42).
; PLAN: r0=378(x), r1=10(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=140(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=42(y), r12=31(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 10
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 319
LDI r6, 140
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 42
LDI r12, 31
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
