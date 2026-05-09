; DESCRIPTION: Places a red dot at position (322, 43).
; PLAN: r0=322(x), r1=43(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 322
LDI r1, 43
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
