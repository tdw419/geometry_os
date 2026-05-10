; DESCRIPTION: Composite: Renders a magenta disk with center (118, 132) and radius 38 then Sets a single blue pixel at (285, 180) then Places a purple 70x112 rectangle at position (430, 109).
; PLAN: r0=118(x), r1=132(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=180(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=109(y), r12=70(width), r13=112(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 132
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 180
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 430
LDI r11, 109
LDI r12, 70
LDI r13, 112
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
