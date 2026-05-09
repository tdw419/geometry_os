; DESCRIPTION: Places a yellow dot at position (140, 186).
; PLAN: r0=140(x), r1=186(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 186
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
