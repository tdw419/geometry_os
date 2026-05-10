; DESCRIPTION: Places a cyan dot at position (278, 144).
; PLAN: r0=278(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
