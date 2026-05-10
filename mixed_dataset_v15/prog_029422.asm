; DESCRIPTION: Composite: Renders a white disk with center (308, 79) and radius 70 then Places a black dot at position (45, 114) then Creates a yellow rectangular region at (121, 33) spanning 107 by 110 pixels.
; PLAN: r0=308(x), r1=79(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=114(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=33(y), r12=107(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 79
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 114
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 121
LDI r11, 33
LDI r12, 107
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
