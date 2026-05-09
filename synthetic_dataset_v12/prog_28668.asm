; DESCRIPTION: Places a purple dot at position (443, 218).
; PLAN: r0=443(x), r1=218(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 443
LDI r1, 218
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
