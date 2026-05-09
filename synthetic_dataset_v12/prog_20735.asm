; DESCRIPTION: Composite: Creates a blue circular shape at (100, 95) with radius 42 then Renders a black line between points (72, 42) and (312, 118) then Places a yellow 89x108 rectangle at position (296, 134).
; PLAN: r0=100(x), r1=95(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x1), r6=42(y1), r7=312(x2), r8=118(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=134(y), r12=89(width), r13=108(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 95
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 42
LDI r7, 312
LDI r8, 118
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 134
LDI r12, 89
LDI r13, 108
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
