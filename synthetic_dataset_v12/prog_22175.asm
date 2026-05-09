; DESCRIPTION: Draws a orange circle centered at (235, 165) with radius 22.
; PLAN: r0=235(x), r1=165(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 165
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
