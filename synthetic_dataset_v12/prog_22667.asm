; DESCRIPTION: Places a yellow dot at position (95, 60).
; PLAN: r0=95(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
