; DESCRIPTION: Draws a orange circle centered at (85, 152) with radius 46.
; PLAN: r0=85(x), r1=152(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 152
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
