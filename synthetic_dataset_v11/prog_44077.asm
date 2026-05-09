; DESCRIPTION: Draws a red circle centered at (217, 200) with radius 10.
; PLAN: r0=217(x), r1=200(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 200
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
