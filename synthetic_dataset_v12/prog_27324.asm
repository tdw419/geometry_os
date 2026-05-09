; DESCRIPTION: Composite: Creates a black circular shape at (333, 138) with radius 27 then Places a white line segment connecting (185, 99) to (7, 100) then Places a red 49x12 rectangle at position (336, 184).
; PLAN: r0=333(x), r1=138(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x1), r6=99(y1), r7=7(x2), r8=100(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=336(x), r11=184(y), r12=49(width), r13=12(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 138
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 99
LDI r7, 7
LDI r8, 100
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 336
LDI r11, 184
LDI r12, 49
LDI r13, 12
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
