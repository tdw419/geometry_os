; DESCRIPTION: Draws a yellow circle centered at (262, 87) with radius 77.
; PLAN: r0=262(x), r1=87(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 87
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
