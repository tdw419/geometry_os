; DESCRIPTION: Draws a orange circle centered at (371, 39) with radius 25.
; PLAN: r0=371(x), r1=39(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 39
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
