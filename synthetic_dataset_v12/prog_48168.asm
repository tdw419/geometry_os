; DESCRIPTION: Composite: Places a purple dot at position (115, 23) then Creates a purple circular shape at (193, 32) with radius 27 then Creates a green rectangular region at (0, 139) spanning 10 by 14 pixels.
; PLAN: r0=115(x), r1=23(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=32(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=139(y), r12=10(width), r13=14(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 23
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 32
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 139
LDI r12, 10
LDI r13, 14
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
