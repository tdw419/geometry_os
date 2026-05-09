; DESCRIPTION: Places a red dot at position (74, 27).
; PLAN: r0=74(x), r1=27(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 27
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
