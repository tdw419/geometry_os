; DESCRIPTION: Places a blue dot at position (102, 187).
; PLAN: r0=102(x), r1=187(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 187
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
