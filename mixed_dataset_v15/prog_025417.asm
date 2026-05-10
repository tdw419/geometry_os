; DESCRIPTION: Composite: Renders a purple box of size 117x110 starting at (378, 58) then Places a magenta dot at position (129, 55) then Draws a purple line from (294, 25) to (274, 188).
; PLAN: r0=378(x), r1=58(y), r2=117(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=55(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=294(x1), r11=25(y1), r12=274(x2), r13=188(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 58
LDI r2, 117
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 55
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 294
LDI r11, 25
LDI r12, 274
LDI r13, 188
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
