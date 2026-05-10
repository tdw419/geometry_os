; DESCRIPTION: Composite: Creates a red circular shape at (133, 87) with radius 79 then Sets a single white pixel at (88, 248) then Renders a magenta box of size 49x93 starting at (155, 33).
; PLAN: r0=133(x), r1=87(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=248(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=155(x), r11=33(y), r12=49(width), r13=93(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 133
LDI r1, 87
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 248
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 155
LDI r11, 33
LDI r12, 49
LDI r13, 93
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
