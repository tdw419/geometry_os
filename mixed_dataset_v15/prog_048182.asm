; DESCRIPTION: Composite: Places a purple circle of radius 27 at center (262, 82) then Places a purple dot at position (10, 137) then Creates a yellow rectangular region at (322, 69) spanning 113 by 16 pixels.
; PLAN: r0=262(x), r1=82(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=137(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=69(y), r12=113(width), r13=16(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 262
LDI r1, 82
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 137
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 322
LDI r11, 69
LDI r12, 113
LDI r13, 16
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
