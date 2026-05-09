; DESCRIPTION: Composite: Places a orange dot at position (141, 194) then Creates a cyan circular shape at (387, 110) with radius 30 then Creates a white rectangular region at (368, 101) spanning 70 by 92 pixels.
; PLAN: r0=141(x), r1=194(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=110(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=101(y), r12=70(width), r13=92(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 194
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 387
LDI r6, 110
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 101
LDI r12, 70
LDI r13, 92
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
