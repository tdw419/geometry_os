; DESCRIPTION: Draws a orange circle centered at (298, 153) with radius 13.
; PLAN: r0=298(x), r1=153(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 153
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
