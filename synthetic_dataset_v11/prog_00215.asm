; DESCRIPTION: Places a green dot at position (93, 186).
; PLAN: r0=93(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
