; DESCRIPTION: Composite: Sets a single blue pixel at (395, 155) then Renders a magenta line between points (45, 207) and (28, 192) then Places a magenta 53x95 rectangle at position (13, 122).
; PLAN: r0=395(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=207(y1), r7=28(x2), r8=192(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=122(y), r12=53(width), r13=95(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 45
LDI r6, 207
LDI r7, 28
LDI r8, 192
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 122
LDI r12, 53
LDI r13, 95
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
