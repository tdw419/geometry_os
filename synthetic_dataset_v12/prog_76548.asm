; DESCRIPTION: Places a magenta dot at position (286, 55).
; PLAN: r0=286(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
