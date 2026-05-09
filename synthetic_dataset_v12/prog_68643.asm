; DESCRIPTION: Places a red dot at position (214, 93).
; PLAN: r0=214(x), r1=93(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 93
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
