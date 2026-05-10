; DESCRIPTION: Places a red dot at position (260, 22).
; PLAN: r0=260(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 260
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
