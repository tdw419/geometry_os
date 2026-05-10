; DESCRIPTION: Composite: Creates a orange circular shape at (67, 111) with radius 66 then Renders a cyan line between points (259, 157) and (141, 87) then Draws a yellow rectangle at (84, 198) with width 11 and height 50.
; PLAN: r0=67(x), r1=111(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x1), r6=157(y1), r7=141(x2), r8=87(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=198(y), r12=11(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 111
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 157
LDI r7, 141
LDI r8, 87
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 198
LDI r12, 11
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
