; DESCRIPTION: Composite: Places a cyan dot at position (114, 8) then Places a yellow circle of radius 52 at center (270, 116) then Places a purple 12x92 rectangle at position (183, 135).
; PLAN: r0=114(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=116(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=135(y), r12=12(width), r13=92(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 114
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 116
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 135
LDI r12, 12
LDI r13, 92
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
