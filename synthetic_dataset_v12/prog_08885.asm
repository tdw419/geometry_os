; DESCRIPTION: Places a white circle of radius 62 at center (440, 81).
; PLAN: r0=440(x), r1=81(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 81
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
