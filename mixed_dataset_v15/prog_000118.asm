; DESCRIPTION: Places a white circle of radius 21 at center (434, 45).
; PLAN: r0=434(x), r1=45(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 45
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
