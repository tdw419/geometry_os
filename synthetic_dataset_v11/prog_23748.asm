; DESCRIPTION: Draws a orange circle centered at (174, 103) with radius 77.
; PLAN: r0=174(x), r1=103(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 103
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
