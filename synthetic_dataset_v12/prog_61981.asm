; DESCRIPTION: Composite: Sets a single green pixel at (484, 232) then Places a green circle of radius 34 at center (370, 124) then Places a black 102x41 rectangle at position (359, 128).
; PLAN: r0=484(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=124(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=128(y), r12=102(width), r13=41(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 370
LDI r6, 124
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 128
LDI r12, 102
LDI r13, 41
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
