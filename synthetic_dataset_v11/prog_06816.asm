; DESCRIPTION: Draws a green circle centered at (132, 121) with radius 80.
; PLAN: r0=132(x), r1=121(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 121
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
