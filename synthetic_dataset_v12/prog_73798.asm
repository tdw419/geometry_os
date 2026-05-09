; DESCRIPTION: Composite: Renders a white line between points (452, 189) and (115, 109) then Sets a single purple pixel at (473, 86) then Creates a magenta rectangular region at (234, 81) spanning 95 by 118 pixels.
; PLAN: r0=452(x1), r1=189(y1), r2=115(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=86(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=234(x), r11=81(y), r12=95(width), r13=118(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 452
LDI r1, 189
LDI r2, 115
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 86
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 234
LDI r11, 81
LDI r12, 95
LDI r13, 118
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
