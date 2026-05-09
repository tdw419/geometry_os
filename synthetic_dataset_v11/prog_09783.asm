; DESCRIPTION: Places a magenta dot at position (21, 188).
; PLAN: r0=21(x), r1=188(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 188
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
