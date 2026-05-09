; DESCRIPTION: Places a white dot at position (272, 18).
; PLAN: r0=272(x), r1=18(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 18
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
