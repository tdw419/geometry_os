; DESCRIPTION: Composite: Places a green circle of radius 49 at center (215, 172) then Draws a green rectangle at (123, 115) with width 30 and height 113 then Draws a purple line from (293, 158) to (0, 141).
; PLAN: r0=215(x), r1=172(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=115(y), r7=30(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x1), r11=158(y1), r12=0(x2), r13=141(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 172
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 115
LDI r7, 30
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 158
LDI r12, 0
LDI r13, 141
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
