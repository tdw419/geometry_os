; DESCRIPTION: Places a cyan dot at position (107, 203).
; PLAN: r0=107(x), r1=203(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 203
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
