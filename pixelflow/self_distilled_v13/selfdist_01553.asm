; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=9(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 9
LDI r2, 0
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
