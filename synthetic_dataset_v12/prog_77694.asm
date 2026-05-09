; DESCRIPTION: Places a orange dot at position (446, 37).
; PLAN: r0=446(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
