; DESCRIPTION: Draws a white circle centered at (363, 108) with radius 24.
; PLAN: r0=363(x), r1=108(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 108
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
