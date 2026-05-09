; DESCRIPTION: Composite: Places a black dot at position (67, 143) then Draws a cyan line from (500, 209) to (69, 198) then Draws a blue circle centered at (274, 163) with radius 46.
; PLAN: r0=67(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=209(y1), r7=69(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=163(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 67
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 500
LDI r6, 209
LDI r7, 69
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 163
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
