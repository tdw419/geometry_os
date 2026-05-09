; DESCRIPTION: Places a blue dot at position (485, 14).
; PLAN: r0=485(x), r1=14(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 14
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
