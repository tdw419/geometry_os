; DESCRIPTION: Places a cyan dot at position (360, 26).
; PLAN: r0=360(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 26
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
