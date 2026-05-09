; DESCRIPTION: Places a blue dot at position (275, 75).
; PLAN: r0=275(x), r1=75(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 75
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
