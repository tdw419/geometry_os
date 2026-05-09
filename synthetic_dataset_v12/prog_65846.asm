; DESCRIPTION: Places a magenta dot at position (418, 13).
; PLAN: r0=418(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
