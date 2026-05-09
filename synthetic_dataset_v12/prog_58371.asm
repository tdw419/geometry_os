; DESCRIPTION: Places a white circle of radius 63 at center (120, 106).
; PLAN: r0=120(x), r1=106(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 106
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
