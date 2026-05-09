; DESCRIPTION: Places a cyan dot at position (59, 2).
; PLAN: r0=59(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
