; DESCRIPTION: Sets a single red pixel at (487, 202).
; PLAN: r0=487(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
