; DESCRIPTION: Composite: Places a green dot at position (53, 192) then Draws a black line from (88, 178) to (395, 248) then Renders a yellow box of size 46x112 starting at (274, 144).
; PLAN: r0=53(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=88(x1), r6=178(y1), r7=395(x2), r8=248(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=144(y), r12=46(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 88
LDI r6, 178
LDI r7, 395
LDI r8, 248
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 144
LDI r12, 46
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
