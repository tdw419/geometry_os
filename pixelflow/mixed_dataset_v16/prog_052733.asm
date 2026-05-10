; DESCRIPTION: Places a white dot at position (195, 63).
; PLAN: r0=195(x), r1=63(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 63
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
