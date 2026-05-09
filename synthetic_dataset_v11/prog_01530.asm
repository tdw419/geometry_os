; DESCRIPTION: Places a white circle of radius 12 at center (215, 126).
; PLAN: r0=215(x), r1=126(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 126
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
