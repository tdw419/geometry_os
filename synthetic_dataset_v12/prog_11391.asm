; DESCRIPTION: Composite: Places a purple 83x96 rectangle at position (360, 116) then Draws a yellow circle centered at (256, 184) with radius 63 then Places a purple line segment connecting (500, 97) to (100, 16).
; PLAN: r0=360(x), r1=116(y), r2=83(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=184(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x1), r11=97(y1), r12=100(x2), r13=16(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 116
LDI r2, 83
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 184
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 97
LDI r12, 100
LDI r13, 16
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
