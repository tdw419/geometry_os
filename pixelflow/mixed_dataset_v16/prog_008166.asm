; DESCRIPTION: Composite: Places a green circle of radius 17 at center (204, 169) then Renders a yellow line between points (164, 112) and (88, 255) then Places a black 67x107 rectangle at position (216, 39).
; PLAN: r0=204(x), r1=169(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x1), r6=112(y1), r7=88(x2), r8=255(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=39(y), r12=67(width), r13=107(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 169
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 112
LDI r7, 88
LDI r8, 255
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 39
LDI r12, 67
LDI r13, 107
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
