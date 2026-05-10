; DESCRIPTION: Places a red dot at position (411, 237).
; PLAN: r0=411(x), r1=237(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 237
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
