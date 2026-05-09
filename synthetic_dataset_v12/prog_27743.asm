; DESCRIPTION: Composite: Draws a yellow rectangle at (210, 121) with width 95 and height 108 then Places a blue line segment connecting (369, 242) to (505, 153) then Places a red dot at position (103, 136).
; PLAN: r0=210(x), r1=121(y), r2=95(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=242(y1), r7=505(x2), r8=153(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=136(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 121
LDI r2, 95
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 242
LDI r7, 505
LDI r8, 153
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 136
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
