; DESCRIPTION: Draws a green circle centered at (180, 115) with radius 74.
; PLAN: r0=180(x), r1=115(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 115
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
