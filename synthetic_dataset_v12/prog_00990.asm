; DESCRIPTION: Composite: Places a black 91x15 rectangle at position (25, 41) then Places a blue line segment connecting (413, 190) to (16, 148) then Draws a blue circle centered at (289, 129) with radius 46.
; PLAN: r0=25(x), r1=41(y), r2=91(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x1), r6=190(y1), r7=16(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=129(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 25
LDI r1, 41
LDI r2, 91
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 190
LDI r7, 16
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 129
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
