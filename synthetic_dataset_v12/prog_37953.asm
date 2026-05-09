; DESCRIPTION: Composite: Creates a blue rectangular region at (33, 75) spanning 39 by 92 pixels then Places a magenta dot at position (219, 104) then Places a black circle of radius 58 at center (133, 166).
; PLAN: r0=33(x), r1=75(y), r2=39(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=133(x), r11=166(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 75
LDI r2, 39
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 133
LDI r11, 166
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
