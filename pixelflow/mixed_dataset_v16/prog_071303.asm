; DESCRIPTION: Places a white dot at position (74, 166).
; PLAN: r0=74(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
