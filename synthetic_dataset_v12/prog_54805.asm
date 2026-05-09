; DESCRIPTION: Places a yellow dot at position (394, 185).
; PLAN: r0=394(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
