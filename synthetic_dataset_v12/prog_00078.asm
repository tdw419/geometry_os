; DESCRIPTION: Composite: Draws a red circle centered at (424, 73) with radius 22 then Places a orange dot at position (504, 235) then Creates a red rectangular region at (411, 133) spanning 48 by 22 pixels.
; PLAN: r0=424(x), r1=73(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=411(x), r11=133(y), r12=48(width), r13=22(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 73
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 411
LDI r11, 133
LDI r12, 48
LDI r13, 22
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
