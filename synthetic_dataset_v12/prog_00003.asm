; DESCRIPTION: Places a orange dot at position (386, 39).
; PLAN: r0=386(x), r1=39(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 386
LDI r1, 39
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
