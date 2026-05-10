; DESCRIPTION: Creates a vertical blue gradient from black to blue.
; PLAN: r0=7(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
