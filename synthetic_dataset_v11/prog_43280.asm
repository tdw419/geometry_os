; DESCRIPTION: Places a cyan dot at position (229, 5).
; PLAN: r0=229(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
