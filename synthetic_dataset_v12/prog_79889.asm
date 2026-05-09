; DESCRIPTION: Places a green dot at position (226, 29).
; PLAN: r0=226(x), r1=29(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 29
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
