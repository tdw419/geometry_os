; DESCRIPTION: Places a cyan dot at position (100, 233).
; PLAN: r0=100(x), r1=233(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 233
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
