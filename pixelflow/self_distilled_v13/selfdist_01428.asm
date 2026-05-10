; DESCRIPTION: Creates a vertical blue gradient from black to blue.
; PLAN: r0=1(x), r1=10(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 10
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
