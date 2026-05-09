; DESCRIPTION: Composite: Renders a orange line between points (456, 157) and (511, 209) then Creates a magenta circular shape at (445, 142) with radius 22 then Places a green 56x84 rectangle at position (101, 47).
; PLAN: r0=456(x1), r1=157(y1), r2=511(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=142(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x), r11=47(y), r12=56(width), r13=84(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 157
LDI r2, 511
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 142
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 47
LDI r12, 56
LDI r13, 84
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
