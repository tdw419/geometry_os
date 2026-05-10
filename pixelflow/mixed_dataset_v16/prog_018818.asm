; DESCRIPTION: Composite: Places a black circle of radius 23 at center (112, 136) then Renders a white box of size 25x74 starting at (53, 6) then Places a white line segment connecting (367, 34) to (477, 191).
; PLAN: r0=112(x), r1=136(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=6(y), r7=25(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=34(y1), r12=477(x2), r13=191(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 136
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 6
LDI r7, 25
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 34
LDI r12, 477
LDI r13, 191
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
