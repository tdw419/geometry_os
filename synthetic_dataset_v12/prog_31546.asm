; DESCRIPTION: Places a cyan circle of radius 77 at center (252, 112).
; PLAN: r0=252(x), r1=112(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 112
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
