; DESCRIPTION: Draws a red circle centered at (90, 181) with radius 48.
; PLAN: r0=90(x), r1=181(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 181
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
