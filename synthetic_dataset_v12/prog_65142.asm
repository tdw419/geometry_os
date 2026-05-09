; DESCRIPTION: Places a black dot at position (362, 239).
; PLAN: r0=362(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 239
LDI r2, 0x000000
PSET r0, r1, r2
HALT
