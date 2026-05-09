; DESCRIPTION: Places a red dot at position (147, 167).
; PLAN: r0=147(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
