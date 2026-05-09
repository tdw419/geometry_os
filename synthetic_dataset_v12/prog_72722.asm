; DESCRIPTION: Draws a orange circle centered at (460, 77) with radius 20.
; PLAN: r0=460(x), r1=77(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 77
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
