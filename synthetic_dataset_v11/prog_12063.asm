; DESCRIPTION: Draws a orange circle centered at (124, 129) with radius 55.
; PLAN: r0=124(x), r1=129(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 129
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
