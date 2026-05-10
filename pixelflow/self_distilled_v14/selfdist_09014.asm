; DESCRIPTION: Places a yellow dot at position (27, 103).
; PLAN: r0=27(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
