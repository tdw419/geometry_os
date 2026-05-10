; DESCRIPTION: Places a magenta dot at position (346, 247).
; PLAN: r0=346(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
