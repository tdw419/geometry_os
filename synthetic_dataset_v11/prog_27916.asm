; DESCRIPTION: Draws a white circle centered at (99, 190) with radius 37.
; PLAN: r0=99(x), r1=190(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 190
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
