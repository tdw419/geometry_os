; DESCRIPTION: Composite: Creates a magenta circular shape at (419, 74) with radius 49 then Sets a single purple pixel at (30, 217) then Creates a white rectangular region at (206, 26) spanning 27 by 114 pixels.
; PLAN: r0=419(x), r1=74(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x), r6=217(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=26(y), r12=27(width), r13=114(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 74
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 217
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 26
LDI r12, 27
LDI r13, 114
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
