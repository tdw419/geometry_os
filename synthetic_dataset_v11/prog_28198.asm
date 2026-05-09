; DESCRIPTION: Places a yellow dot at position (240, 121).
; PLAN: r0=240(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
