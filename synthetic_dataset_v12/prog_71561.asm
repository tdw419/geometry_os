; DESCRIPTION: Draws a green circle centered at (305, 133) with radius 75.
; PLAN: r0=305(x), r1=133(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 133
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
