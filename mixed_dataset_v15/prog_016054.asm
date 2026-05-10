; DESCRIPTION: Draws a orange circle centered at (350, 198) with radius 46.
; PLAN: r0=350(x), r1=198(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 198
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
