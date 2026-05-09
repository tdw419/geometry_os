; DESCRIPTION: Places a yellow dot at position (339, 170).
; PLAN: r0=339(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
