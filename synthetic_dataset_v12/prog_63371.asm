; DESCRIPTION: Composite: Creates a red rectangular region at (183, 5) spanning 75 by 120 pixels then Creates a purple circular shape at (143, 96) with radius 64 then Sets a single red pixel at (369, 171).
; PLAN: r0=183(x), r1=5(y), r2=75(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=96(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=369(x), r11=171(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 5
LDI r2, 75
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 96
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 369
LDI r11, 171
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
