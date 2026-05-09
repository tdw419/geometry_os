; DESCRIPTION: Places a white circle of radius 58 at center (336, 128).
; PLAN: r0=336(x), r1=128(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 128
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
