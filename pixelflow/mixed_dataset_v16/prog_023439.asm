; DESCRIPTION: Composite: Creates a cyan rectangular region at (58, 3) spanning 71 by 114 pixels then Creates a purple circular shape at (124, 93) with radius 59 then Places a purple dot at position (133, 166).
; PLAN: r0=58(x), r1=3(y), r2=71(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=93(y), r7=59(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=166(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 3
LDI r2, 71
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 93
LDI r7, 59
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 166
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
