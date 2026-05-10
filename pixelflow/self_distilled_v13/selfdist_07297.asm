; DESCRIPTION: Places a red dot at position (171, 148).
; PLAN: r0=171(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
