; DESCRIPTION: Places a cyan dot at position (171, 188).
; PLAN: r0=171(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
