; DESCRIPTION: Draws a white circle centered at (151, 125) with radius 42.
; PLAN: r0=151(x), r1=125(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 125
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
