; DESCRIPTION: Places a magenta dot at position (148, 192).
; PLAN: r0=148(x), r1=192(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 192
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
