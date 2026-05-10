; DESCRIPTION: Draws a red circle centered at (264, 172) with radius 48.
; PLAN: r0=264(x), r1=172(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 172
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
