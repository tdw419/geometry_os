; DESCRIPTION: Places a magenta dot at position (173, 8).
; PLAN: r0=173(x), r1=8(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 8
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
