; DESCRIPTION: Places a red dot at position (64, 103).
; PLAN: r0=64(x), r1=103(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 103
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
