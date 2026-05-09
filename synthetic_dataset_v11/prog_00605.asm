; DESCRIPTION: Places a magenta dot at position (204, 224).
; PLAN: r0=204(x), r1=224(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 224
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
