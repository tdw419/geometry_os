; DESCRIPTION: Places a red dot at position (210, 28).
; PLAN: r0=210(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
