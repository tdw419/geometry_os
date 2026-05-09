; DESCRIPTION: Places a yellow dot at position (485, 230).
; PLAN: r0=485(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
