; DESCRIPTION: Places a white dot at position (507, 234).
; PLAN: r0=507(x), r1=234(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 234
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
