; DESCRIPTION: Places a white circle of radius 79 at center (296, 100).
; PLAN: r0=296(x), r1=100(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 100
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
