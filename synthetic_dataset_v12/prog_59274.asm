; DESCRIPTION: Draws a white circle centered at (82, 70) with radius 49.
; PLAN: r0=82(x), r1=70(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 70
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
