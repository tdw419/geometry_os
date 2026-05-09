; DESCRIPTION: Draws a yellow circle centered at (83, 129) with radius 79.
; PLAN: r0=83(x), r1=129(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 129
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
