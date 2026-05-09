; DESCRIPTION: Draws a white circle centered at (87, 48) with radius 16.
; PLAN: r0=87(x), r1=48(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 48
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
