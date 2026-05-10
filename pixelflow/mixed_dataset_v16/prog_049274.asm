; DESCRIPTION: Composite: Renders a magenta box of size 18x97 starting at (480, 154) then Places a purple dot at position (316, 37) then Places a purple line segment connecting (103, 165) to (378, 20).
; PLAN: r0=480(x), r1=154(y), r2=18(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=37(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=103(x1), r11=165(y1), r12=378(x2), r13=20(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 154
LDI r2, 18
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 37
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 165
LDI r12, 378
LDI r13, 20
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
