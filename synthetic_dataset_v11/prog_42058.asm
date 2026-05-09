; DESCRIPTION: Draws a red circle centered at (43, 124) with radius 10.
; PLAN: r0=43(x), r1=124(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 124
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
