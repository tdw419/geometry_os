; DESCRIPTION: Places a black dot at position (410, 95).
; PLAN: r0=410(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 410
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
HALT
