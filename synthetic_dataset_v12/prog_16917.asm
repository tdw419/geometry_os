; DESCRIPTION: Places a black circle of radius 30 at center (349, 134).
; PLAN: r0=349(x), r1=134(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 134
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
