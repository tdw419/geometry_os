; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=3(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 10
LDI r2, 0
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
