; DESCRIPTION: Composite: Renders a yellow box of size 12x118 starting at (143, 131) then Places a yellow dot at position (153, 14) then Places a purple circle of radius 37 at center (466, 160).
; PLAN: r0=143(x), r1=131(y), r2=12(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x), r6=14(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=466(x), r11=160(y), r12=37(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 131
LDI r2, 12
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 14
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 466
LDI r11, 160
LDI r12, 37
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
