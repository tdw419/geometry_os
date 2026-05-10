; DESCRIPTION: Places a red dot at position (290, 94).
; PLAN: r0=290(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
