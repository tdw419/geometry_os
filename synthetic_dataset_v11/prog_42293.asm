; DESCRIPTION: Places a cyan dot at position (148, 218).
; PLAN: r0=148(x), r1=218(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 218
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
