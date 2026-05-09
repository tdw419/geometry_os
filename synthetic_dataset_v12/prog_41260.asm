; DESCRIPTION: Composite: Places a yellow dot at position (455, 64) then Creates a black circular shape at (297, 122) with radius 65 then Places a orange 68x100 rectangle at position (210, 152).
; PLAN: r0=455(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=122(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=152(y), r12=68(width), r13=100(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 297
LDI r6, 122
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 152
LDI r12, 68
LDI r13, 100
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
