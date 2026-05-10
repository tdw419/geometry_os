; DESCRIPTION: Composite: Renders a yellow line between points (95, 4) and (308, 98) then Draws a yellow circle centered at (341, 184) with radius 70 then Places a yellow 76x40 rectangle at position (254, 165).
; PLAN: r0=95(x1), r1=4(y1), r2=308(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=184(y), r7=70(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=165(y), r12=76(width), r13=40(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 4
LDI r2, 308
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 184
LDI r7, 70
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 165
LDI r12, 76
LDI r13, 40
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
