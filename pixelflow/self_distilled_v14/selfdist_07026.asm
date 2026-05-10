; DESCRIPTION: Places a white dot at position (226, 96).
; PLAN: r0=226(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
