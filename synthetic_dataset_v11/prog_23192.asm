; DESCRIPTION: Places a white dot at position (21, 166).
; PLAN: r0=21(x), r1=166(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 166
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
