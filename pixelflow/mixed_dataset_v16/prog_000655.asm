; DESCRIPTION: Places a magenta dot at position (347, 189).
; PLAN: r0=347(x), r1=189(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 347
LDI r1, 189
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
