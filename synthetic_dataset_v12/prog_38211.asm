; DESCRIPTION: Draws a white circle centered at (66, 93) with radius 50.
; PLAN: r0=66(x), r1=93(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 93
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
