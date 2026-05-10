; DESCRIPTION: Composite: Places a black 68x46 rectangle at position (372, 77) then Draws a white circle centered at (332, 191) with radius 44.
; PLAN: r0=372(x), r1=77(y), r2=68(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x), r6=191(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 77
LDI r2, 68
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 191
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
