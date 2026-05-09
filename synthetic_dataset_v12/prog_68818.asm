; DESCRIPTION: Draws a orange circle centered at (291, 149) with radius 70.
; PLAN: r0=291(x), r1=149(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 149
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
