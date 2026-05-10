; DESCRIPTION: Places a cyan dot at position (288, 86).
; PLAN: r0=288(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 288
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
