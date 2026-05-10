; DESCRIPTION: Draws a white circle centered at (197, 157) with radius 60.
; PLAN: r0=197(x), r1=157(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 157
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
