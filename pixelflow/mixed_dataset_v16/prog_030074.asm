; DESCRIPTION: Places a cyan dot at position (128, 245).
; PLAN: r0=128(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
