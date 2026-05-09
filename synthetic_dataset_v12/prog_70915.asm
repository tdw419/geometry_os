; DESCRIPTION: Places a cyan dot at position (333, 229).
; PLAN: r0=333(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 333
LDI r1, 229
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
