; DESCRIPTION: Composite: Places a magenta dot at position (364, 11) then Draws a black rectangle at (36, 62) with width 102 and height 50 then Places a magenta line segment connecting (431, 219) to (316, 20).
; PLAN: r0=364(x), r1=11(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=62(y), r7=102(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x1), r11=219(y1), r12=316(x2), r13=20(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 11
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 62
LDI r7, 102
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 219
LDI r12, 316
LDI r13, 20
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
