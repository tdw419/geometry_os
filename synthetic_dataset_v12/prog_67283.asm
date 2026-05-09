; DESCRIPTION: Draws a orange circle centered at (90, 124) with radius 64.
; PLAN: r0=90(x), r1=124(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 124
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
