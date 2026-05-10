; DESCRIPTION: Composite: Draws a white line from (190, 104) to (114, 64) then Places a black dot at position (254, 67) then Creates a yellow rectangular region at (139, 52) spanning 111 by 104 pixels.
; PLAN: r0=190(x1), r1=104(y1), r2=114(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=139(x), r11=52(y), r12=111(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 104
LDI r2, 114
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 139
LDI r11, 52
LDI r12, 111
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
