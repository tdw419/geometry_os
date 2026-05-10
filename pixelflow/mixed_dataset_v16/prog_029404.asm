; DESCRIPTION: Places a magenta dot at position (340, 174).
; PLAN: r0=340(x), r1=174(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 174
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
