; DESCRIPTION: Draws a orange circle centered at (491, 129) with radius 14.
; PLAN: r0=491(x), r1=129(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 129
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
