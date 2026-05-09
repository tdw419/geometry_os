; DESCRIPTION: Composite: Creates a magenta circular shape at (280, 69) with radius 52 then Sets a single red pixel at (10, 104) then Creates a purple rectangular region at (411, 173) spanning 100 by 64 pixels.
; PLAN: r0=280(x), r1=69(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=411(x), r11=173(y), r12=100(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 69
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 411
LDI r11, 173
LDI r12, 100
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
