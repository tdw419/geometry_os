; DESCRIPTION: Composite: Places a white circle of radius 65 at center (343, 109) then Sets a single yellow pixel at (202, 1) then Renders a black box of size 84x112 starting at (153, 51).
; PLAN: r0=343(x), r1=109(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=1(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=51(y), r12=84(width), r13=112(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 109
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 1
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 153
LDI r11, 51
LDI r12, 84
LDI r13, 112
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
