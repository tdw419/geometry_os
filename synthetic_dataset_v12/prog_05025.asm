; DESCRIPTION: Places a white dot at position (349, 254).
; PLAN: r0=349(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 254
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
