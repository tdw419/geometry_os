; DESCRIPTION: Places a magenta dot at position (217, 246).
; PLAN: r0=217(x), r1=246(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 246
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
