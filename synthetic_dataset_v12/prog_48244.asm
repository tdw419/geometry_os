; DESCRIPTION: Places a cyan dot at position (141, 123).
; PLAN: r0=141(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
