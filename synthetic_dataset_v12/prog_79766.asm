; DESCRIPTION: Draws a white circle centered at (450, 185) with radius 44.
; PLAN: r0=450(x), r1=185(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 185
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
