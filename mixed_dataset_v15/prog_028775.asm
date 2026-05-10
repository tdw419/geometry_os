; DESCRIPTION: Composite: Places a blue line segment connecting (125, 53) to (296, 184) then Places a magenta circle of radius 54 at center (211, 128) then Creates a red rectangular region at (132, 83) spanning 98 by 32 pixels.
; PLAN: r0=125(x1), r1=53(y1), r2=296(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=128(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=83(y), r12=98(width), r13=32(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 53
LDI r2, 296
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 128
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 83
LDI r12, 98
LDI r13, 32
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
