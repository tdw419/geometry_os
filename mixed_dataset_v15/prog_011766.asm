; DESCRIPTION: Draws a green circle centered at (344, 145) with radius 77.
; PLAN: r0=344(x), r1=145(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 145
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
