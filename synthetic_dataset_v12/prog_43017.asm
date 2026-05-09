; DESCRIPTION: Composite: Renders a white box of size 75x42 starting at (400, 38) then Places a magenta dot at position (447, 248) then Places a black line segment connecting (495, 24) to (282, 217).
; PLAN: r0=400(x), r1=38(y), r2=75(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=248(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=495(x1), r11=24(y1), r12=282(x2), r13=217(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 38
LDI r2, 75
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 248
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 495
LDI r11, 24
LDI r12, 282
LDI r13, 217
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
