; DESCRIPTION: Places a cyan dot at position (352, 29).
; PLAN: r0=352(x), r1=29(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 29
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
