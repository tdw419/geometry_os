; DESCRIPTION: Places a cyan dot at position (385, 49).
; PLAN: r0=385(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
