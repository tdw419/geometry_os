; DESCRIPTION: Composite: Renders a white line between points (278, 158) and (264, 247) then Draws a cyan circle centered at (338, 165) with radius 56 then Places a purple 45x11 rectangle at position (413, 206).
; PLAN: r0=278(x1), r1=158(y1), r2=264(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=165(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=413(x), r11=206(y), r12=45(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 158
LDI r2, 264
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 165
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 413
LDI r11, 206
LDI r12, 45
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
