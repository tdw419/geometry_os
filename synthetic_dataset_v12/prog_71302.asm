; DESCRIPTION: Places a cyan dot at position (101, 55).
; PLAN: r0=101(x), r1=55(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 55
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
