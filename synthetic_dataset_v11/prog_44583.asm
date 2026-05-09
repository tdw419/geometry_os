; DESCRIPTION: Places a red dot at position (182, 128).
; PLAN: r0=182(x), r1=128(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 128
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
