; DESCRIPTION: Places a red dot at position (362, 163).
; PLAN: r0=362(x), r1=163(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 163
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
