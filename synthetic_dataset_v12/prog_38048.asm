; DESCRIPTION: Composite: Places a purple circle of radius 65 at center (280, 151) then Places a yellow dot at position (45, 25) then Creates a black rectangular region at (95, 18) spanning 68 by 97 pixels.
; PLAN: r0=280(x), r1=151(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=95(x), r11=18(y), r12=68(width), r13=97(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 151
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 95
LDI r11, 18
LDI r12, 68
LDI r13, 97
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
