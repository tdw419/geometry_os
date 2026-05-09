; DESCRIPTION: Places a orange dot at position (268, 32).
; PLAN: r0=268(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
