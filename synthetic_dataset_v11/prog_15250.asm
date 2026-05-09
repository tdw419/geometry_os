; DESCRIPTION: Draws a red circle centered at (185, 23) with radius 21.
; PLAN: r0=185(x), r1=23(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 23
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
