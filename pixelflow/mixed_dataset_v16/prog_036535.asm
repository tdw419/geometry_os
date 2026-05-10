; DESCRIPTION: Places a orange dot at position (275, 177).
; PLAN: r0=275(x), r1=177(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 177
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
