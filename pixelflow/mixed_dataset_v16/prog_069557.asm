; DESCRIPTION: Places a purple dot at position (507, 59).
; PLAN: r0=507(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
