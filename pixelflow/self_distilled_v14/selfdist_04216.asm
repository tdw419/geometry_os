; DESCRIPTION: Places a cyan dot at position (340, 78).
; PLAN: r0=340(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
