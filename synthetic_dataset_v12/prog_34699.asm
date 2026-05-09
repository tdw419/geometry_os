; DESCRIPTION: Composite: Draws a white line from (427, 105) to (115, 139) then Places a green circle of radius 36 at center (233, 197) then Places a white 40x75 rectangle at position (95, 73).
; PLAN: r0=427(x1), r1=105(y1), r2=115(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=197(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=73(y), r12=40(width), r13=75(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 105
LDI r2, 115
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 197
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 73
LDI r12, 40
LDI r13, 75
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
