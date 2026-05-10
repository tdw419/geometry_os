; DESCRIPTION: Places a white dot at position (136, 126).
; PLAN: r0=136(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
