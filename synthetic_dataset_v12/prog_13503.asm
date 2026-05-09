; DESCRIPTION: Places a magenta dot at position (353, 239).
; PLAN: r0=353(x), r1=239(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 239
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
