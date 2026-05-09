; DESCRIPTION: Composite: Places a cyan dot at position (137, 141) then Creates a purple circular shape at (78, 60) with radius 55 then Creates a red rectangular region at (35, 21) spanning 60 by 47 pixels.
; PLAN: r0=137(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=60(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=35(x), r11=21(y), r12=60(width), r13=47(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 60
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 35
LDI r11, 21
LDI r12, 60
LDI r13, 47
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
