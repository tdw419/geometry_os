; DESCRIPTION: Draws a yellow circle centered at (109, 180) with radius 61.
; PLAN: r0=109(x), r1=180(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 180
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
