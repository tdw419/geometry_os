; DESCRIPTION: Places a yellow dot at position (263, 15).
; PLAN: r0=263(x), r1=15(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 15
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
