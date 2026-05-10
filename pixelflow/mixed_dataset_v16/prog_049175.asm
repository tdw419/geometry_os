; DESCRIPTION: Places a black dot at position (458, 228).
; PLAN: r0=458(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 458
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
HALT
