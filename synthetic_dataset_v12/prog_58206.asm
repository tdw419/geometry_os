; DESCRIPTION: Places a cyan dot at position (127, 15).
; PLAN: r0=127(x), r1=15(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 15
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
