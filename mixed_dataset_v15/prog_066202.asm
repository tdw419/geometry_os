; DESCRIPTION: Draws a red circle centered at (218, 19) with radius 18.
; PLAN: r0=218(x), r1=19(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 19
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
