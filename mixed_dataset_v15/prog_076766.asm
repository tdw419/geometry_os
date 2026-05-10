; DESCRIPTION: Places a cyan dot at position (17, 172).
; PLAN: r0=17(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
