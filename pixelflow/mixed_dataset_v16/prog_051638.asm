; DESCRIPTION: Draws a orange circle centered at (160, 161) with radius 57.
; PLAN: r0=160(x), r1=161(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 161
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
