; DESCRIPTION: Places a red dot at position (163, 198).
; PLAN: r0=163(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
