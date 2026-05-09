; DESCRIPTION: Places a black dot at position (443, 160).
; PLAN: r0=443(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 443
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
HALT
