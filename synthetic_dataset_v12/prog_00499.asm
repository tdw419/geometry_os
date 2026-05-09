; DESCRIPTION: Places a orange dot at position (212, 202).
; PLAN: r0=212(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
