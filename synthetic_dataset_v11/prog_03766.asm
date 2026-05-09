; DESCRIPTION: Draws a orange circle centered at (92, 198) with radius 52.
; PLAN: r0=92(x), r1=198(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 198
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
