; DESCRIPTION: Places a red dot at position (288, 123).
; PLAN: r0=288(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 288
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
