; DESCRIPTION: Composite: Places a blue line segment connecting (206, 45) to (429, 72) then Creates a white circular shape at (120, 86) with radius 10 then Places a purple 92x96 rectangle at position (61, 88).
; PLAN: r0=206(x1), r1=45(y1), r2=429(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=120(x), r6=86(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=61(x), r11=88(y), r12=92(width), r13=96(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 45
LDI r2, 429
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 86
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 61
LDI r11, 88
LDI r12, 92
LDI r13, 96
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
