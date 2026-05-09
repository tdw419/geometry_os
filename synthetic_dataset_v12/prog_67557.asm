; DESCRIPTION: Draws a green circle centered at (188, 131) with radius 70.
; PLAN: r0=188(x), r1=131(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 131
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
