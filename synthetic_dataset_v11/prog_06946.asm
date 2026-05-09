; DESCRIPTION: Places a blue dot at position (228, 64).
; PLAN: r0=228(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
