; DESCRIPTION: Places a yellow dot at position (65, 103).
; PLAN: r0=65(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
