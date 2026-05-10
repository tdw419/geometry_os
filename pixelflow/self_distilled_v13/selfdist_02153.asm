; DESCRIPTION: Places a purple dot at position (45, 174).
; PLAN: r0=45(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 174
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
