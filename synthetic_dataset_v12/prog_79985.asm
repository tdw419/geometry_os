; DESCRIPTION: Composite: Places a blue dot at position (347, 7) then Creates a cyan circular shape at (124, 163) with radius 35 then Places a orange 47x65 rectangle at position (133, 169).
; PLAN: r0=347(x), r1=7(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=163(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=169(y), r12=47(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 7
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 163
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 169
LDI r12, 47
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
