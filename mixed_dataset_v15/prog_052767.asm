; DESCRIPTION: Composite: Sets a single yellow pixel at (92, 64) then Places a purple circle of radius 26 at center (74, 229) then Creates a red rectangular region at (396, 79) spanning 87 by 81 pixels.
; PLAN: r0=92(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=229(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=79(y), r12=87(width), r13=81(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 74
LDI r6, 229
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 79
LDI r12, 87
LDI r13, 81
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
