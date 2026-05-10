; DESCRIPTION: Composite: Sets a single red pixel at (173, 185) then Creates a purple circular shape at (243, 70) with radius 62 then Places a magenta 24x55 rectangle at position (270, 179).
; PLAN: r0=173(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=70(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=270(x), r11=179(y), r12=24(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 243
LDI r6, 70
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 270
LDI r11, 179
LDI r12, 24
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
