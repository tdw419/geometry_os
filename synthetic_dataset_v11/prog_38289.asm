; DESCRIPTION: Places a cyan dot at position (181, 184).
; PLAN: r0=181(x), r1=184(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 184
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
