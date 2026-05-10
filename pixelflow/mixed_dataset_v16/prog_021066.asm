; DESCRIPTION: Composite: Creates a magenta circular shape at (85, 148) with radius 46 then Sets a single red pixel at (327, 125) then Creates a purple rectangular region at (237, 66) spanning 96 by 50 pixels.
; PLAN: r0=85(x), r1=148(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=125(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=66(y), r12=96(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 148
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 125
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 237
LDI r11, 66
LDI r12, 96
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
