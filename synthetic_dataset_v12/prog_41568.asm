; DESCRIPTION: Places a red dot at position (493, 54).
; PLAN: r0=493(x), r1=54(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 54
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
