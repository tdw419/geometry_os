; DESCRIPTION: Draws a orange circle centered at (46, 222) with radius 14.
; PLAN: r0=46(x), r1=222(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 222
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
