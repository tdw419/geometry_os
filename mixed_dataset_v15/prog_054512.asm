; DESCRIPTION: Places a white dot at position (390, 107).
; PLAN: r0=390(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
