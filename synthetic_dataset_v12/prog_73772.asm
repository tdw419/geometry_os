; DESCRIPTION: Places a yellow dot at position (250, 113).
; PLAN: r0=250(x), r1=113(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 113
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
