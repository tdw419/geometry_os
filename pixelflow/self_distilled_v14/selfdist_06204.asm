; DESCRIPTION: Places a magenta dot at position (374, 4).
; PLAN: r0=374(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
