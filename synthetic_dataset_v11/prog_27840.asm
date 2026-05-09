; DESCRIPTION: Places a cyan dot at position (24, 221).
; PLAN: r0=24(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
