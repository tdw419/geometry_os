; DESCRIPTION: Composite: Places a magenta dot at position (432, 155) then Renders a blue box of size 101x85 starting at (139, 36) then Places a black line segment connecting (352, 216) to (304, 159).
; PLAN: r0=432(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=36(y), r7=101(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x1), r11=216(y1), r12=304(x2), r13=159(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 36
LDI r7, 101
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 216
LDI r12, 304
LDI r13, 159
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
