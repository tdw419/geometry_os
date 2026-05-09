; DESCRIPTION: Places a magenta dot at position (283, 215).
; PLAN: r0=283(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 215
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
