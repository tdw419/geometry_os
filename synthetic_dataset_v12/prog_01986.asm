; DESCRIPTION: Composite: Creates a black circular shape at (278, 110) with radius 70 then Sets a single orange pixel at (49, 146) then Renders a white box of size 61x116 starting at (142, 59).
; PLAN: r0=278(x), r1=110(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=146(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=142(x), r11=59(y), r12=61(width), r13=116(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 110
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 146
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 142
LDI r11, 59
LDI r12, 61
LDI r13, 116
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
