; DESCRIPTION: Places a magenta dot at position (294, 68).
; PLAN: r0=294(x), r1=68(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 294
LDI r1, 68
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
