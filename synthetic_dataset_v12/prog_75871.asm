; DESCRIPTION: Composite: Places a blue dot at position (376, 158) then Places a purple circle of radius 43 at center (377, 69) then Draws a white line from (18, 114) to (331, 73).
; PLAN: r0=376(x), r1=158(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=69(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=114(y1), r12=331(x2), r13=73(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 158
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 69
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 114
LDI r12, 331
LDI r13, 73
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
