; DESCRIPTION: Composite: Draws a red rectangle at (225, 100) with width 25 and height 14 then Places a cyan circle of radius 67 at center (103, 146) then Renders a black line between points (163, 123) and (433, 99).
; PLAN: r0=225(x), r1=100(y), r2=25(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=146(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=163(x1), r11=123(y1), r12=433(x2), r13=99(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 100
LDI r2, 25
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 146
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 163
LDI r11, 123
LDI r12, 433
LDI r13, 99
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
