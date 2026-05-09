; DESCRIPTION: Places a yellow dot at position (26, 42).
; PLAN: r0=26(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
