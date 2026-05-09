; DESCRIPTION: Places a magenta dot at position (460, 221).
; PLAN: r0=460(x), r1=221(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 221
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
