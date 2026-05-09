; DESCRIPTION: Composite: Draws a white circle centered at (212, 141) with radius 69 then Places a orange dot at position (495, 177) then Creates a yellow rectangular region at (342, 80) spanning 74 by 66 pixels.
; PLAN: r0=212(x), r1=141(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x), r6=177(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=342(x), r11=80(y), r12=74(width), r13=66(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 141
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 177
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 342
LDI r11, 80
LDI r12, 74
LDI r13, 66
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
