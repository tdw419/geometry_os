; DESCRIPTION: Places a magenta dot at position (199, 244).
; PLAN: r0=199(x), r1=244(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 244
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
