; DESCRIPTION: Places a white dot at position (460, 180).
; PLAN: r0=460(x), r1=180(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 180
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
