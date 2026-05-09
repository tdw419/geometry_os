; DESCRIPTION: Places a cyan dot at position (377, 38).
; PLAN: r0=377(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 377
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
