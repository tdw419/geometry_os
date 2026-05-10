; DESCRIPTION: Draws a orange circle centered at (160, 59) with radius 51.
; PLAN: r0=160(x), r1=59(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 59
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
