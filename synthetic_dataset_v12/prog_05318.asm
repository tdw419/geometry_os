; DESCRIPTION: Places a cyan dot at position (488, 118).
; PLAN: r0=488(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 488
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
