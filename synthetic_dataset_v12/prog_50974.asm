; DESCRIPTION: Draws a orange circle centered at (393, 25) with radius 16.
; PLAN: r0=393(x), r1=25(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 25
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
