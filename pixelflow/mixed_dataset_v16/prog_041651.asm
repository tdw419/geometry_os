; DESCRIPTION: Composite: Places a purple circle of radius 11 at center (26, 193) then Places a magenta dot at position (119, 33) then Creates a yellow rectangular region at (367, 20) spanning 87 by 60 pixels.
; PLAN: r0=26(x), r1=193(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=33(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=367(x), r11=20(y), r12=87(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 193
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 33
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 367
LDI r11, 20
LDI r12, 87
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
