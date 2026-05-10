; DESCRIPTION: Places a white dot at position (161, 155).
; PLAN: r0=161(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
