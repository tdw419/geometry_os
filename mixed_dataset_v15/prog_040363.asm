; DESCRIPTION: Composite: Places a green 116x55 rectangle at position (280, 131) then Sets a single white pixel at (54, 14) then Renders a purple disk with center (90, 93) and radius 31.
; PLAN: r0=280(x), r1=131(y), r2=116(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=14(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=93(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 131
LDI r2, 116
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 14
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 90
LDI r11, 93
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
