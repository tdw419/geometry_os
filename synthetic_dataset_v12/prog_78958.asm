; DESCRIPTION: Places a black dot at position (308, 214).
; PLAN: r0=308(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT
