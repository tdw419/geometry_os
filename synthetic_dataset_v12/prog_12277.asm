; DESCRIPTION: Places a cyan dot at position (327, 248).
; PLAN: r0=327(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 327
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
