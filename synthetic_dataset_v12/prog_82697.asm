; DESCRIPTION: Composite: Places a red line segment connecting (217, 110) to (463, 191) then Sets a single red pixel at (65, 126) then Creates a purple rectangular region at (397, 24) spanning 27 by 36 pixels.
; PLAN: r0=217(x1), r1=110(y1), r2=463(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=126(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=24(y), r12=27(width), r13=36(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 110
LDI r2, 463
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 126
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 397
LDI r11, 24
LDI r12, 27
LDI r13, 36
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
