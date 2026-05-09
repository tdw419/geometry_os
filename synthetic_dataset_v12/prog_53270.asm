; DESCRIPTION: Composite: Draws a purple line from (88, 171) to (445, 86) then Draws a cyan rectangle at (6, 35) with width 72 and height 52 then Places a white circle of radius 48 at center (441, 165).
; PLAN: r0=88(x1), r1=171(y1), r2=445(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=35(y), r7=72(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=165(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 171
LDI r2, 445
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 35
LDI r7, 72
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 165
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
