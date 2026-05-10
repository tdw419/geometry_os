; DESCRIPTION: Places a magenta dot at position (215, 248).
; PLAN: r0=215(x), r1=248(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 248
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
