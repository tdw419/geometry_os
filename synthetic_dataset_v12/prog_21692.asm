; DESCRIPTION: Composite: Renders a green line between points (490, 128) and (53, 109) then Places a orange dot at position (221, 2) then Draws a yellow rectangle at (420, 70) with width 22 and height 99.
; PLAN: r0=490(x1), r1=128(y1), r2=53(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=2(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=70(y), r12=22(width), r13=99(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 128
LDI r2, 53
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 2
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 420
LDI r11, 70
LDI r12, 22
LDI r13, 99
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
