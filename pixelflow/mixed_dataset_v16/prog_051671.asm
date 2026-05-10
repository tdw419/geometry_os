; DESCRIPTION: Places a cyan dot at position (507, 171).
; PLAN: r0=507(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
