; DESCRIPTION: Places a black dot at position (329, 215).
; PLAN: r0=329(x), r1=215(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 215
LDI r2, 0x000000
PSET r0, r1, r2
HALT
