; DESCRIPTION: Places a red dot at position (86, 254).
; PLAN: r0=86(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
