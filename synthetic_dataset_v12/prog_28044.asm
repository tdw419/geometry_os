; DESCRIPTION: Places a red dot at position (330, 21).
; PLAN: r0=330(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
