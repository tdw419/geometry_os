; DESCRIPTION: Draws a red circle centered at (151, 199) with radius 57.
; PLAN: r0=151(x), r1=199(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 199
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
