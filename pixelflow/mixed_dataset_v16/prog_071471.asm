; DESCRIPTION: Composite: Renders a red line between points (336, 56) and (415, 56) then Places a cyan circle of radius 68 at center (378, 123) then Places a magenta 45x51 rectangle at position (162, 94).
; PLAN: r0=336(x1), r1=56(y1), r2=415(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=123(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=94(y), r12=45(width), r13=51(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 56
LDI r2, 415
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 123
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 94
LDI r12, 45
LDI r13, 51
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
