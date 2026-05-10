; DESCRIPTION: Composite: Places a orange line segment connecting (185, 198) to (5, 223) then Creates a white circular shape at (401, 172) with radius 55 then Places a magenta 102x105 rectangle at position (314, 42).
; PLAN: r0=185(x1), r1=198(y1), r2=5(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=172(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=42(y), r12=102(width), r13=105(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 185
LDI r1, 198
LDI r2, 5
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 172
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 42
LDI r12, 102
LDI r13, 105
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
