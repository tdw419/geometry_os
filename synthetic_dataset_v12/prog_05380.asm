; DESCRIPTION: Composite: Places a black 62x105 rectangle at position (244, 132) then Creates a magenta circular shape at (404, 131) with radius 66 then Places a cyan line segment connecting (5, 169) to (163, 110).
; PLAN: r0=244(x), r1=132(y), r2=62(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=131(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x1), r11=169(y1), r12=163(x2), r13=110(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 132
LDI r2, 62
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 131
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 169
LDI r12, 163
LDI r13, 110
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
