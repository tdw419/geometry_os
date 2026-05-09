; DESCRIPTION: Places a black dot at position (263, 198).
; PLAN: r0=263(x), r1=198(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 263
LDI r1, 198
LDI r2, 0x000000
PSET r0, r1, r2
HALT
