; DESCRIPTION: Composite: Creates a orange rectangular region at (39, 60) spanning 98 by 55 pixels then Sets a single blue pixel at (176, 253) then Places a yellow circle of radius 18 at center (254, 38).
; PLAN: r0=39(x), r1=60(y), r2=98(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=253(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=38(y), r12=18(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 60
LDI r2, 98
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 253
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 38
LDI r12, 18
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
