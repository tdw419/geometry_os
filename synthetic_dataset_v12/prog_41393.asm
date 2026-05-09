; DESCRIPTION: Places a cyan dot at position (174, 4).
; PLAN: r0=174(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
