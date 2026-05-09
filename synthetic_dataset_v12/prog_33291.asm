; DESCRIPTION: Places a black dot at position (360, 27).
; PLAN: r0=360(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
HALT
