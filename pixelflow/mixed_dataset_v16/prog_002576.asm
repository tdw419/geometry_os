; DESCRIPTION: Composite: Renders a white line between points (21, 52) and (387, 81) then Draws a purple rectangle at (131, 40) with width 71 and height 56 then Places a blue circle of radius 43 at center (55, 192).
; PLAN: r0=21(x1), r1=52(y1), r2=387(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=40(y), r7=71(width), r8=56(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=192(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 52
LDI r2, 387
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 40
LDI r7, 71
LDI r8, 56
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 192
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
