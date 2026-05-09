; DESCRIPTION: Places a cyan dot at position (95, 197).
; PLAN: r0=95(x), r1=197(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 197
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
