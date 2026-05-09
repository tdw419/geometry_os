; DESCRIPTION: Draws a red circle centered at (77, 70) with radius 56.
; PLAN: r0=77(x), r1=70(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 70
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
