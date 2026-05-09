; DESCRIPTION: Draws a green circle centered at (198, 57) with radius 44.
; PLAN: r0=198(x), r1=57(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 57
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
