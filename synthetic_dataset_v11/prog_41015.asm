; DESCRIPTION: Places a white dot at position (111, 159).
; PLAN: r0=111(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
