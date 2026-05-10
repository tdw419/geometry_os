; DESCRIPTION: Places a black dot at position (173, 1).
; PLAN: r0=173(x), r1=1(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 1
LDI r2, 0x000000
PSET r0, r1, r2
HALT
