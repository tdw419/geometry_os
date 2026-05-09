; DESCRIPTION: Draws a green circle centered at (238, 179) with radius 74.
; PLAN: r0=238(x), r1=179(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 179
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
