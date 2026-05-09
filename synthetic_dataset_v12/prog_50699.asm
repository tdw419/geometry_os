; DESCRIPTION: Places a white dot at position (362, 164).
; PLAN: r0=362(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
