; DESCRIPTION: Places a cyan dot at position (280, 40).
; PLAN: r0=280(x), r1=40(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 280
LDI r1, 40
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
