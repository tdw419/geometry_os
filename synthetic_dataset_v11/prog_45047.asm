; DESCRIPTION: Draws a green circle centered at (133, 143) with radius 40.
; PLAN: r0=133(x), r1=143(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 143
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
