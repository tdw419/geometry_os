; DESCRIPTION: Places a cyan dot at position (350, 129).
; PLAN: r0=350(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
