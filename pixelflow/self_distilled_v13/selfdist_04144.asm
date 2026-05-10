; DESCRIPTION: Creates a orange diamond shape using 4 lines meeting at the center.
; PLAN: r0=34(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 4
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
