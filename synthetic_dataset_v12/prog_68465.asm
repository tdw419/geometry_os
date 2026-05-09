; DESCRIPTION: Composite: Renders a red disk with center (429, 62) and radius 32 then Places a green dot at position (136, 53) then Creates a black rectangular region at (50, 109) spanning 114 by 100 pixels.
; PLAN: r0=429(x), r1=62(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=53(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=50(x), r11=109(y), r12=114(width), r13=100(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 62
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 53
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 50
LDI r11, 109
LDI r12, 114
LDI r13, 100
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
