; DESCRIPTION: Draws a green circle centered at (74, 74) with radius 56.
; PLAN: r0=74(x), r1=74(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 74
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
