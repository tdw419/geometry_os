; DESCRIPTION: Places a cyan dot at position (344, 27).
; PLAN: r0=344(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
