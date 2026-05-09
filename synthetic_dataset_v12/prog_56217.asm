; DESCRIPTION: Places a cyan dot at position (372, 234).
; PLAN: r0=372(x), r1=234(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 234
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
