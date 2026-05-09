; DESCRIPTION: Places a white dot at position (221, 105).
; PLAN: r0=221(x), r1=105(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 105
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
