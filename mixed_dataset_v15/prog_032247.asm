; DESCRIPTION: Composite: Places a cyan line segment connecting (11, 67) to (361, 251) then Places a purple dot at position (413, 100) then Draws a black rectangle at (22, 102) with width 69 and height 35.
; PLAN: r0=11(x1), r1=67(y1), r2=361(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=100(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=22(x), r11=102(y), r12=69(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 67
LDI r2, 361
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 100
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 22
LDI r11, 102
LDI r12, 69
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
