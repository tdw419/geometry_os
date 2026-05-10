; DESCRIPTION: Places a yellow dot at position (365, 70).
; PLAN: r0=365(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 365
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
