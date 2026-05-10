; DESCRIPTION: Places a purple dot at position (392, 92).
; PLAN: r0=392(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
