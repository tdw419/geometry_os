; DESCRIPTION: Places a white dot at position (315, 142).
; PLAN: r0=315(x), r1=142(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 315
LDI r1, 142
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
