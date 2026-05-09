; DESCRIPTION: Draws a red circle centered at (103, 77) with radius 33.
; PLAN: r0=103(x), r1=77(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 77
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
