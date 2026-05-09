; DESCRIPTION: Draws a red circle centered at (84, 84) with radius 80.
; PLAN: r0=84(x), r1=84(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 84
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
