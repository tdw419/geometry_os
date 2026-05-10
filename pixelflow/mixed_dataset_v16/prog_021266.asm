; DESCRIPTION: Places a cyan dot at position (67, 70).
; PLAN: r0=67(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
