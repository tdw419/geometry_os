; DESCRIPTION: Places a red dot at position (364, 91).
; PLAN: r0=364(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
