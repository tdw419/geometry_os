; DESCRIPTION: Places a cyan dot at position (88, 103).
; PLAN: r0=88(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
