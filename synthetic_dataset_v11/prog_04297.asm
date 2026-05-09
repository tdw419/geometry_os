; DESCRIPTION: Places a cyan dot at position (99, 227).
; PLAN: r0=99(x), r1=227(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 227
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
