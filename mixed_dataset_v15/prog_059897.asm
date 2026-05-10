; DESCRIPTION: Sets a single blue pixel at (502, 89).
; PLAN: r0=502(x), r1=89(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 502
LDI r1, 89
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
