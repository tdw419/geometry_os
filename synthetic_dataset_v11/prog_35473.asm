; DESCRIPTION: Places a red dot at position (209, 248).
; PLAN: r0=209(x), r1=248(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 248
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
