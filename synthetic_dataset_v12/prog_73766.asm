; DESCRIPTION: Sets a single red pixel at (489, 91).
; PLAN: r0=489(x), r1=91(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 91
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
