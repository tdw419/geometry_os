; DESCRIPTION: Composite: Creates a blue circular shape at (432, 109) with radius 68 then Sets a single yellow pixel at (186, 9) then Places a cyan 35x21 rectangle at position (272, 181).
; PLAN: r0=432(x), r1=109(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=181(y), r12=35(width), r13=21(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 109
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 272
LDI r11, 181
LDI r12, 35
LDI r13, 21
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
