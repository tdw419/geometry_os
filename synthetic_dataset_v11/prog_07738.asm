; DESCRIPTION: Places a cyan dot at position (132, 162).
; PLAN: r0=132(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
