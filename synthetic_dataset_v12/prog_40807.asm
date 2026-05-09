; DESCRIPTION: Composite: Places a black circle of radius 61 at center (312, 79) then Places a magenta dot at position (400, 53) then Creates a black rectangular region at (97, 81) spanning 42 by 119 pixels.
; PLAN: r0=312(x), r1=79(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=81(y), r12=42(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 79
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 97
LDI r11, 81
LDI r12, 42
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
