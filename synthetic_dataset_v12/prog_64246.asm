; DESCRIPTION: Places a black dot at position (495, 231).
; PLAN: r0=495(x), r1=231(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 495
LDI r1, 231
LDI r2, 0x000000
PSET r0, r1, r2
HALT
