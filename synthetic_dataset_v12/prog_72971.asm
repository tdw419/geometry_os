; DESCRIPTION: Draws a green circle centered at (74, 152) with radius 61.
; PLAN: r0=74(x), r1=152(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 152
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
