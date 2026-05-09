; DESCRIPTION: Places a red dot at position (446, 252).
; PLAN: r0=446(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
