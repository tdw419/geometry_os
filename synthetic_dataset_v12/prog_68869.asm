; DESCRIPTION: Composite: Places a yellow dot at position (151, 254) then Creates a yellow circular shape at (116, 118) with radius 35 then Draws a white rectangle at (374, 36) with width 100 and height 32.
; PLAN: r0=151(x), r1=254(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=118(y), r7=35(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=36(y), r12=100(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 151
LDI r1, 254
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 118
LDI r7, 35
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 36
LDI r12, 100
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
