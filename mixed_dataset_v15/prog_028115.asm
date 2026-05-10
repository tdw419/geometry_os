; DESCRIPTION: Draws a green circle centered at (271, 109) with radius 31.
; PLAN: r0=271(x), r1=109(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 109
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
