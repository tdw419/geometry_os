; DESCRIPTION: Composite: Places a cyan dot at position (184, 98) then Places a black circle of radius 58 at center (156, 101) then Creates a red rectangular region at (435, 121) spanning 13 by 16 pixels.
; PLAN: r0=184(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=101(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x), r11=121(y), r12=13(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 101
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 121
LDI r12, 13
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
