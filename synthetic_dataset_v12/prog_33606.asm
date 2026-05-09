; DESCRIPTION: Draws a green circle centered at (431, 190) with radius 57.
; PLAN: r0=431(x), r1=190(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 190
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
