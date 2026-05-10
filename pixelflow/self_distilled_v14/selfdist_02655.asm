; DESCRIPTION: Places a yellow dot at position (307, 65).
; PLAN: r0=307(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
