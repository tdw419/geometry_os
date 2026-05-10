; DESCRIPTION: Places a white dot at position (337, 143).
; PLAN: r0=337(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 337
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
