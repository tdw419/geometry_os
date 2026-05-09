; DESCRIPTION: Places a orange dot at position (347, 237).
; PLAN: r0=347(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 347
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
