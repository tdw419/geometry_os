; DESCRIPTION: Places a white circle of radius 57 at center (90, 168).
; PLAN: r0=90(x), r1=168(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 168
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
