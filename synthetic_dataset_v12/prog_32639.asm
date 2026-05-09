; DESCRIPTION: Composite: Places a blue dot at position (118, 64) then Draws a yellow circle centered at (203, 88) with radius 47.
; PLAN: r0=118(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=88(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 203
LDI r6, 88
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
