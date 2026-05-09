; DESCRIPTION: Draws a green circle centered at (450, 73) with radius 55.
; PLAN: r0=450(x), r1=73(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 73
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
