; DESCRIPTION: Composite: Sets a single yellow pixel at (62, 30) then Draws a black circle centered at (411, 128) with radius 49 then Creates a cyan rectangular region at (368, 30) spanning 98 by 95 pixels.
; PLAN: r0=62(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=128(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=30(y), r12=98(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 411
LDI r6, 128
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 30
LDI r12, 98
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
