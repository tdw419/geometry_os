; DESCRIPTION: Places a cyan dot at position (22, 141).
; PLAN: r0=22(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
