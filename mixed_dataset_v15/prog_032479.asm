; DESCRIPTION: Composite: Places a white dot at position (58, 43) then Places a cyan circle of radius 49 at center (133, 113) then Places a black 65x62 rectangle at position (117, 83).
; PLAN: r0=58(x), r1=43(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=113(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=83(y), r12=65(width), r13=62(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 43
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 113
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 83
LDI r12, 65
LDI r13, 62
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
