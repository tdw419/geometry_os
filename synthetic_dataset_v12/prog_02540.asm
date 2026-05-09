; DESCRIPTION: Places a magenta dot at position (298, 148).
; PLAN: r0=298(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
