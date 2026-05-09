; DESCRIPTION: Composite: Places a yellow 77x118 rectangle at position (118, 110) then Places a blue circle of radius 55 at center (151, 135).
; PLAN: r0=118(x), r1=110(y), r2=77(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=135(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 110
LDI r2, 77
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 135
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
