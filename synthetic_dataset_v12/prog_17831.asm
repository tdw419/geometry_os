; DESCRIPTION: Places a yellow dot at position (131, 212).
; PLAN: r0=131(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 212
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
