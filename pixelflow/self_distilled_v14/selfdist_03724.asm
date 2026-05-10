; DESCRIPTION: Places a white dot at position (32, 195).
; PLAN: r0=32(x), r1=195(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 195
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
