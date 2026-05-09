; DESCRIPTION: Composite: Creates a yellow circular shape at (58, 121) with radius 13 then Places a yellow dot at position (79, 94) then Creates a green rectangular region at (177, 57) spanning 31 by 75 pixels.
; PLAN: r0=58(x), r1=121(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=94(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=57(y), r12=31(width), r13=75(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 121
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 94
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 177
LDI r11, 57
LDI r12, 31
LDI r13, 75
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
