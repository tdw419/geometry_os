; DESCRIPTION: Places a orange dot at position (481, 214).
; PLAN: r0=481(x), r1=214(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 214
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
