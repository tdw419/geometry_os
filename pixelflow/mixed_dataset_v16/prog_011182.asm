; DESCRIPTION: Composite: Places a magenta circle of radius 18 at center (325, 75) then Creates a purple rectangular region at (48, 145) spanning 112 by 55 pixels.
; PLAN: r0=325(x), r1=75(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=145(y), r7=112(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 75
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 145
LDI r7, 112
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
