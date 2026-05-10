; DESCRIPTION: Composite: Renders a black box of size 107x81 starting at (9, 47) then Draws a black line from (287, 47) to (351, 230) then Renders a yellow disk with center (171, 121) and radius 67.
; PLAN: r0=9(x), r1=47(y), r2=107(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x1), r6=47(y1), r7=351(x2), r8=230(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=121(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 47
LDI r2, 107
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 47
LDI r7, 351
LDI r8, 230
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 121
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
