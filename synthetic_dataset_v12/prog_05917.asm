; DESCRIPTION: Draws a orange circle centered at (177, 166) with radius 29.
; PLAN: r0=177(x), r1=166(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 166
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
