; DESCRIPTION: Places a black dot at position (10, 50).
; PLAN: r0=10(x), r1=50(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 50
LDI r2, 0x000000
PSET r0, r1, r2
HALT
