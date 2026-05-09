; DESCRIPTION: Composite: Places a orange dot at position (237, 162) then Draws a orange circle centered at (148, 174) with radius 43 then Creates a black rectangular region at (301, 45) spanning 112 by 95 pixels.
; PLAN: r0=237(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=148(x), r6=174(y), r7=43(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x), r11=45(y), r12=112(width), r13=95(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 148
LDI r6, 174
LDI r7, 43
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 45
LDI r12, 112
LDI r13, 95
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
