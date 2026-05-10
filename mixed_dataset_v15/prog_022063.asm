; DESCRIPTION: Composite: Draws a black rectangle at (399, 92) with width 51 and height 95 then Creates a red circular shape at (372, 225) with radius 12.
; PLAN: r0=399(x), r1=92(y), r2=51(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=225(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 92
LDI r2, 51
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 225
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
