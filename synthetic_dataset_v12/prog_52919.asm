; DESCRIPTION: Places a cyan dot at position (81, 220).
; PLAN: r0=81(x), r1=220(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 220
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
