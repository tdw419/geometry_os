; DESCRIPTION: Composite: Sets a single purple pixel at (25, 180) then Places a yellow line segment connecting (442, 228) to (142, 184) then Creates a blue rectangular region at (476, 28) spanning 21 by 105 pixels.
; PLAN: r0=25(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=442(x1), r6=228(y1), r7=142(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=28(y), r12=21(width), r13=105(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 442
LDI r6, 228
LDI r7, 142
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 28
LDI r12, 21
LDI r13, 105
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
