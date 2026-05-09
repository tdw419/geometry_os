; DESCRIPTION: Places a yellow dot at position (4, 126).
; PLAN: r0=4(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
