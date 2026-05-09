; DESCRIPTION: Draws a green circle centered at (467, 233) with radius 21.
; PLAN: r0=467(x), r1=233(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 233
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
