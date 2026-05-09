; DESCRIPTION: Composite: Places a purple circle of radius 43 at center (105, 142) then Places a red dot at position (142, 74) then Renders a red box of size 30x71 starting at (222, 127).
; PLAN: r0=105(x), r1=142(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=74(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=127(y), r12=30(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 142
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 74
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 222
LDI r11, 127
LDI r12, 30
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
