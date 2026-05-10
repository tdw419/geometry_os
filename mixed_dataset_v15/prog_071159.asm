; DESCRIPTION: Composite: Places a yellow dot at position (64, 73) then Places a purple circle of radius 17 at center (194, 103) then Places a purple 15x120 rectangle at position (77, 25).
; PLAN: r0=64(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=103(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=25(y), r12=15(width), r13=120(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 103
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 25
LDI r12, 15
LDI r13, 120
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
