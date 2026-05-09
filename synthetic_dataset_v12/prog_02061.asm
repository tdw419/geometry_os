; DESCRIPTION: Composite: Sets a single orange pixel at (447, 133) then Renders a red disk with center (300, 128) and radius 52 then Renders a white box of size 102x95 starting at (286, 116).
; PLAN: r0=447(x), r1=133(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=128(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=286(x), r11=116(y), r12=102(width), r13=95(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 447
LDI r1, 133
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 300
LDI r6, 128
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 286
LDI r11, 116
LDI r12, 102
LDI r13, 95
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
