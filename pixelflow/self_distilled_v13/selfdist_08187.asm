; DESCRIPTION: Draws a horizontal white gradient across the screen.
; PLAN: r0=1(x), r1=18(y), r2=1(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 1
LDI r1, 18
LDI r2, 1
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
