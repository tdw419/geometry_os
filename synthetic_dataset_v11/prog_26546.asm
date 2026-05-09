; DESCRIPTION: Places a cyan dot at position (244, 71).
; PLAN: r0=244(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
