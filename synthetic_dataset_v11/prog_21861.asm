; DESCRIPTION: Places a cyan circle of radius 15 at center (184, 134).
; PLAN: r0=184(x), r1=134(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 134
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
