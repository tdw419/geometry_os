; DESCRIPTION: Places a magenta dot at position (173, 235).
; PLAN: r0=173(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
