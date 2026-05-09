; DESCRIPTION: Composite: Renders a orange box of size 116x88 starting at (149, 136) then Renders a magenta disk with center (113, 229) and radius 10 then Places a black line segment connecting (250, 128) to (174, 142).
; PLAN: r0=149(x), r1=136(y), r2=116(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=229(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x1), r11=128(y1), r12=174(x2), r13=142(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 136
LDI r2, 116
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 229
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 128
LDI r12, 174
LDI r13, 142
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
