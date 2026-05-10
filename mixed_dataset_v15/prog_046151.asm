; DESCRIPTION: Composite: Places a black dot at position (198, 69) then Draws a black line from (424, 140) to (421, 139) then Renders a black box of size 19x108 starting at (233, 115).
; PLAN: r0=198(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=424(x1), r6=140(y1), r7=421(x2), r8=139(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=115(y), r12=19(width), r13=108(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 424
LDI r6, 140
LDI r7, 421
LDI r8, 139
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 115
LDI r12, 19
LDI r13, 108
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
