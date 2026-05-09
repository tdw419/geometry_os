; DESCRIPTION: Places a cyan dot at position (131, 103).
; PLAN: r0=131(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
