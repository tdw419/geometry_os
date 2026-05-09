; DESCRIPTION: Composite: Renders a green box of size 74x72 starting at (191, 139) then Draws a blue line from (236, 141) to (505, 24) then Places a green circle of radius 67 at center (243, 170).
; PLAN: r0=191(x), r1=139(y), r2=74(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=141(y1), r7=505(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=170(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 191
LDI r1, 139
LDI r2, 74
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 141
LDI r7, 505
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 170
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
