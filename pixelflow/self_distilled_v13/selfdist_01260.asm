; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=3(x), r1=1(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
