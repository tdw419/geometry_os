; DESCRIPTION: Composite: Renders a yellow line between points (90, 204) and (38, 23) then Renders a blue box of size 112x76 starting at (387, 110) then Places a purple circle of radius 64 at center (114, 165).
; PLAN: r0=90(x1), r1=204(y1), r2=38(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=110(y), r7=112(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=165(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 204
LDI r2, 38
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 110
LDI r7, 112
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 165
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
