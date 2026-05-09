; DESCRIPTION: Places a yellow dot at position (144, 50).
; PLAN: r0=144(x), r1=50(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 50
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
