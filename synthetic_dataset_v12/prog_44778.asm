; DESCRIPTION: Composite: Draws a red circle centered at (424, 64) with radius 18 then Renders a green line between points (20, 184) and (172, 18) then Places a white 35x71 rectangle at position (163, 18).
; PLAN: r0=424(x), r1=64(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x1), r6=184(y1), r7=172(x2), r8=18(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=163(x), r11=18(y), r12=35(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 64
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 184
LDI r7, 172
LDI r8, 18
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 18
LDI r12, 35
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
