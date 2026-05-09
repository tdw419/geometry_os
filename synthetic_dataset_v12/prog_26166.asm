; DESCRIPTION: Draws a white circle centered at (450, 169) with radius 56.
; PLAN: r0=450(x), r1=169(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 169
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
