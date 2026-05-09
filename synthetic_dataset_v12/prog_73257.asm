; DESCRIPTION: Draws a green circle centered at (429, 93) with radius 70.
; PLAN: r0=429(x), r1=93(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 93
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
