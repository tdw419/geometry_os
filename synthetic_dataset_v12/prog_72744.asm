; DESCRIPTION: Composite: Places a orange 16x28 rectangle at position (8, 92) then Renders a blue line between points (123, 188) and (142, 248) then Creates a blue circular shape at (446, 45) with radius 19.
; PLAN: r0=8(x), r1=92(y), r2=16(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=188(y1), r7=142(x2), r8=248(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=45(y), r12=19(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 8
LDI r1, 92
LDI r2, 16
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 188
LDI r7, 142
LDI r8, 248
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 45
LDI r12, 19
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
