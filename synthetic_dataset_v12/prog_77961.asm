; DESCRIPTION: Composite: Places a red 87x37 rectangle at position (299, 111) then Sets a single magenta pixel at (116, 118) then Places a purple line segment connecting (43, 151) to (506, 51).
; PLAN: r0=299(x), r1=111(y), r2=87(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=118(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=43(x1), r11=151(y1), r12=506(x2), r13=51(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 111
LDI r2, 87
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 118
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 151
LDI r12, 506
LDI r13, 51
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
