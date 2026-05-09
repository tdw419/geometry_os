; DESCRIPTION: Places a red dot at position (27, 195).
; PLAN: r0=27(x), r1=195(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 195
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
