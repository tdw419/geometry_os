; DESCRIPTION: Places a cyan dot at position (43, 225).
; PLAN: r0=43(x), r1=225(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 225
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
