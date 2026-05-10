; DESCRIPTION: Composite: Draws a blue line from (455, 22) to (143, 67) then Draws a purple rectangle at (103, 47) with width 118 and height 91 then Places a cyan circle of radius 45 at center (463, 131).
; PLAN: r0=455(x1), r1=22(y1), r2=143(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=47(y), r7=118(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=463(x), r11=131(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 22
LDI r2, 143
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 47
LDI r7, 118
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 463
LDI r11, 131
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
