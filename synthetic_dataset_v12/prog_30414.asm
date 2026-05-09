; DESCRIPTION: Places a red dot at position (213, 176).
; PLAN: r0=213(x), r1=176(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 176
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
