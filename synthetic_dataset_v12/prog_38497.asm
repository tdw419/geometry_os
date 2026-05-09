; DESCRIPTION: Composite: Places a white 14x101 rectangle at position (35, 116) then Places a black line segment connecting (285, 239) to (8, 199) then Sets a single magenta pixel at (19, 131).
; PLAN: r0=35(x), r1=116(y), r2=14(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x1), r6=239(y1), r7=8(x2), r8=199(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=131(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 116
LDI r2, 14
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 239
LDI r7, 8
LDI r8, 199
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 131
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
