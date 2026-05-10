; DESCRIPTION: Places a red dot at position (485, 119).
; PLAN: r0=485(x), r1=119(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 119
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
