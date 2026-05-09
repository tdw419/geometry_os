; DESCRIPTION: Places a white circle of radius 65 at center (182, 120).
; PLAN: r0=182(x), r1=120(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 120
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
