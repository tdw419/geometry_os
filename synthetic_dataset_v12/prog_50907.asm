; DESCRIPTION: Places a white circle of radius 70 at center (273, 121).
; PLAN: r0=273(x), r1=121(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 121
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
