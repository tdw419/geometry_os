; DESCRIPTION: Places a black dot at position (346, 49).
; PLAN: r0=346(x), r1=49(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 49
LDI r2, 0x000000
PSET r0, r1, r2
HALT
