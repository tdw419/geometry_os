; DESCRIPTION: Places a purple dot at position (507, 133).
; PLAN: r0=507(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
