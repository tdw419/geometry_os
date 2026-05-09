; DESCRIPTION: Creates a white circular shape at (133, 82) with radius 39.
; PLAN: r0=133(x), r1=82(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 82
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
