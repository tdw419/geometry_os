; DESCRIPTION: Places a white circle of radius 76 at center (380, 147).
; PLAN: r0=380(x), r1=147(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 147
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
