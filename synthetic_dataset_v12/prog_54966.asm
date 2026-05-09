; DESCRIPTION: Places a red dot at position (476, 187).
; PLAN: r0=476(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
