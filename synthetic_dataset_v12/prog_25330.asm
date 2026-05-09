; DESCRIPTION: Places a white dot at position (197, 120).
; PLAN: r0=197(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
