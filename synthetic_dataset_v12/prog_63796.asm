; DESCRIPTION: Places a cyan circle of radius 76 at center (402, 171).
; PLAN: r0=402(x), r1=171(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 171
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
