; DESCRIPTION: Draws a white circle centered at (206, 110) with radius 42.
; PLAN: r0=206(x), r1=110(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 110
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
