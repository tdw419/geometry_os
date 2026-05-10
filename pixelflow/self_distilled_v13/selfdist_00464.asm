; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=4(x), r1=18(y), r2=0xFF0000(color). Op: SUB r0, r1, r2.
LDI r0, 4
LDI r1, 18
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
