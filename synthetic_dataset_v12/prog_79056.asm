; DESCRIPTION: Places a green dot at position (481, 116).
; PLAN: r0=481(x), r1=116(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 116
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
