; DESCRIPTION: Places a orange dot at position (285, 94).
; PLAN: r0=285(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 285
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
