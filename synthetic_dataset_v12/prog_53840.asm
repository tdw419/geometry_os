; DESCRIPTION: Places a red dot at position (352, 171).
; PLAN: r0=352(x), r1=171(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 171
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
