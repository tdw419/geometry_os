; DESCRIPTION: Places a cyan dot at position (342, 212).
; PLAN: r0=342(x), r1=212(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 342
LDI r1, 212
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
