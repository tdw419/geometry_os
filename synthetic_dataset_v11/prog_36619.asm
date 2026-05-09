; DESCRIPTION: Places a red dot at position (229, 201).
; PLAN: r0=229(x), r1=201(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 201
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
