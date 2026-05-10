; DESCRIPTION: Places a cyan dot at position (23, 143).
; PLAN: r0=23(x), r1=143(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 143
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
