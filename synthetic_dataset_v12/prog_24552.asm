; DESCRIPTION: Places a orange dot at position (442, 230).
; PLAN: r0=442(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 442
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
