; DESCRIPTION: Places a cyan dot at position (24, 208).
; PLAN: r0=24(x), r1=208(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 208
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
