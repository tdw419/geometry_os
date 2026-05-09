; DESCRIPTION: Composite: Renders a black disk with center (266, 162) and radius 70 then Places a yellow dot at position (421, 255) then Creates a orange rectangular region at (193, 64) spanning 72 by 65 pixels.
; PLAN: r0=266(x), r1=162(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=193(x), r11=64(y), r12=72(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 162
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 193
LDI r11, 64
LDI r12, 72
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
