; DESCRIPTION: Places a white circle of radius 32 at center (140, 206).
; PLAN: r0=140(x), r1=206(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 206
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
