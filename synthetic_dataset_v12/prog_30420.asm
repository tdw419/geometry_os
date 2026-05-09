; DESCRIPTION: Composite: Sets a single blue pixel at (165, 135) then Creates a blue circular shape at (94, 145) with radius 78 then Places a yellow 94x34 rectangle at position (248, 62).
; PLAN: r0=165(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=145(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=62(y), r12=94(width), r13=34(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 145
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 62
LDI r12, 94
LDI r13, 34
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
