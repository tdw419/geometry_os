; DESCRIPTION: Draws a white circle centered at (87, 5) with radius 27.
; PLAN: r0=87(x), r1=5(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 5
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
