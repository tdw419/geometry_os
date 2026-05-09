; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (110, 39) then Draws a green rectangle at (252, 20) with width 53 and height 117 then Renders a blue line between points (260, 127) and (371, 139).
; PLAN: r0=110(x), r1=39(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x), r6=20(y), r7=53(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x1), r11=127(y1), r12=371(x2), r13=139(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 39
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 20
LDI r7, 53
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 127
LDI r12, 371
LDI r13, 139
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
