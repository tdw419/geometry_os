; DESCRIPTION: Places a cyan dot at position (445, 60).
; PLAN: r0=445(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
