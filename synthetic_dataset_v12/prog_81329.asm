; DESCRIPTION: Composite: Draws a white circle centered at (432, 81) with radius 74 then Places a magenta dot at position (506, 151) then Places a white 56x20 rectangle at position (108, 116).
; PLAN: r0=432(x), r1=81(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=506(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=108(x), r11=116(y), r12=56(width), r13=20(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 81
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 506
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 108
LDI r11, 116
LDI r12, 56
LDI r13, 20
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
