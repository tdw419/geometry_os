; DESCRIPTION: Composite: Draws a orange circle centered at (452, 186) with radius 48 then Places a blue dot at position (494, 169) then Renders a black box of size 104x31 starting at (301, 152).
; PLAN: r0=452(x), r1=186(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x), r6=169(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=301(x), r11=152(y), r12=104(width), r13=31(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 186
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 169
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 301
LDI r11, 152
LDI r12, 104
LDI r13, 31
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
