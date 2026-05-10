; DESCRIPTION: Composite: Renders a orange line between points (472, 1) and (65, 207) then Creates a magenta circular shape at (206, 111) with radius 76 then Places a red 86x96 rectangle at position (308, 11).
; PLAN: r0=472(x1), r1=1(y1), r2=65(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=111(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=11(y), r12=86(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 1
LDI r2, 65
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 111
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 11
LDI r12, 86
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
