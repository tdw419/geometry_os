; DESCRIPTION: Places a cyan dot at position (212, 128).
; PLAN: r0=212(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
