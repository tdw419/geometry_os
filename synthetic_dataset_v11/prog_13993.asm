; DESCRIPTION: Places a white dot at position (75, 30).
; PLAN: r0=75(x), r1=30(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 30
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
