; DESCRIPTION: Draws a green circle centered at (217, 112) with radius 68.
; PLAN: r0=217(x), r1=112(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 112
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
